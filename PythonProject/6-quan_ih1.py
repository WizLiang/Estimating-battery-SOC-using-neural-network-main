import torch
import torch.nn as nn
from torch.quantization import quantize_dynamic
import numpy as np
from mydataloader import my_dataloder
from pruning import apply_pruning_to_lstm
from torchinfo import summary

# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'
seq_len = 30


'''加载数据库'''

norm_dict = {}
xy_dict = {}
norm_dict = np.load(save_path + 'norm_dict.npy',allow_pickle=True).item()
xy_dict = np.load(save_path + 'xy_dict.npy',allow_pickle=True).item()

# --------------------------训练模型部分-----------------------------------
train_x = xy_dict['train_x'].astype(np.float32)
train_y = xy_dict['train_y'].astype(np.float32)
test_x = xy_dict['test_x'].astype(np.float32)
test_y = xy_dict['test_y'].astype(np.float32)

# 设置超参数
seq_len = 30
bs = 128
epochs = 20
hidden_size = 32
num_layers = 2
input_size = train_x.shape[-1]

# 数据打包
train_dl, test_dl = my_dataloder(train_x, train_y, test_x, test_y, bs, shuffle=True)





# 加载剪枝并训练好的模型
model_path = save_path + 'model_quantized_ih0_hh0.pth'
model = torch.load(model_path)
model.eval()



def Q(a):  
    a = a.to('cpu')
    b = a.detach().numpy()
    b = np.round(b * 128)
    b = np.clip(b, -127, 127)
    b = b / 128
    a.data = torch.from_numpy(b).data
    return a

#0.03303659606906699 -0.875, 0.875



with torch.no_grad():
    model.rnn.weight_ih_l0 = Q(model.rnn.weight_ih_l0)
    model.rnn.bias_ih_l0 = Q(model.rnn.bias_ih_l0)
    model.rnn.weight_hh_l0 = Q(model.rnn.weight_hh_l0)
    model.rnn.bias_hh_l0 = Q(model.rnn.bias_hh_l0)
    model.rnn.weight_ih_l1 = Q(model.rnn.weight_ih_l1)
#apply_pruning_to_lstm(model.rnn, k=2) 


def check_pruning(model):
    total_params = 0
    zero_params = 0
    for param in model.parameters():
        # 将所有参数展平成一维，便于计算
        param_flat = param.view(-1)
        total_params += param_flat.size(0)
        # 计算值为0的参数数量
        zero_params += torch.sum(param_flat == 0).item()
    
    # 计算被剪枝的参数所占的比例
    pruned_ratio = zero_params / total_params
    print(f"Total parameters: {total_params}, Zero parameters: {zero_params}, Pruned ratio: {pruned_ratio:.2%}")

check_pruning(model)
#定义mask，保持剪枝权重保持不变
#定义mask，保持剪枝权重保持不变
mask = []
for name, param in model.named_parameters():
    if "weight" in name:
        # 创建掩码，标记非零值
        mask_param = (param.data != 0).float()
        mask.append(mask_param)
    else:
        # 对于偏置等其他参数，我们不应用掩码，因此使用全1掩码
        mask.append(torch.ones_like(param))

#定义应用Mask的辅助函数
def apply_mask(model, mask):
    with torch.no_grad():  # 在应用掩码时不计算梯度
        for param, m in zip(model.parameters(), mask):
            param.data.mul_(m)


'''测试量化模型'''


# 测试量化模型性能的函数
def test_model(model, dataloader):
    model.eval()
    total_loss = 0
    with torch.no_grad():
        for inputs, targets in dataloader:
            inputs = inputs.to(model.device)  # 确保数据在正确的设备上
            outputs = model(inputs)
            loss = nn.MSELoss()(outputs, targets)
            total_loss += loss.item()
    average_loss = total_loss / len(dataloader)
    return average_loss


test_loss = test_model(model, test_dl)
print(f"Test Loss After quantization: {test_loss}")


def get_trainable_params(model):
    for name, param in model.named_parameters():
        # 排除已经量化的参数
        if name not in ['rnn.weight_ih_l0','rnn.bias_ih_l0','rnn.weight_hh_l0','rnn.bias_hh_l0']:
            yield param

# 使用自定义参数集配置优化器
loss_fn = nn.MSELoss()
optimizer = torch.optim.Adam(get_trainable_params(model), lr=0.001)

summary(model, input_size=(bs, seq_len, input_size))

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)  # 确保模型在正确的设备上

# 训练过程
train_loss = []
test_loss = []
for epoch in range(epochs):
    model.train()
    for inputs, targets in train_dl:
        inputs, targets = inputs.to(device), targets.to(device)
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = loss_fn(outputs, targets)
        loss.backward()
        optimizer.step()
        apply_mask(model, mask)  # 每次参数更新后应用掩码

    # 在测试集上评估
    model.eval()
    total_test_loss = 0
    with torch.no_grad():
        for inputs, targets in test_dl:
            inputs, targets = inputs.to(model.device), targets.to(model.device)
            outputs = model(inputs)
            loss_val = loss_fn(outputs, targets)
            total_test_loss += loss_val.item()

    epoch_test_loss = total_test_loss / len(test_dl)
    test_loss.append(epoch_test_loss)

    print(f'Epoch {epoch+1}: Train Loss: {loss.item()}, Test Loss: {epoch_test_loss}')

print('Done!')
#测试剪枝

check_pruning(model)

"""完成对bias的剪枝和训练"""
with torch.no_grad():
    model.rnn.weight_ih_l0 = Q(model.rnn.weight_ih_l0)
    model.rnn.bias_ih_l0 = Q(model.rnn.bias_ih_l0)
    model.rnn.weight_hh_l0 = Q(model.rnn.weight_hh_l0)
    model.rnn.bias_hh_l0 = Q(model.rnn.bias_hh_l0)
    model.rnn.weight_ih_l1 = Q(model.rnn.weight_ih_l1)
    model.rnn.bias_ih_l1 = Q(model.rnn.bias_ih_l1)

def get_trainable_params(model):
    for name, param in model.named_parameters():
        # 排除已经量化的参数
        if name not in ['rnn.weight_ih_l0','rnn.bias_ih_l0','rnn.weight_hh_l0','rnn.bias_hh_l0','rnn.weight_ih_l1','rnn.bias_ih_l1']:
            yield param

# 使用自定义参数集配置优化器
loss_fn = nn.MSELoss()
optimizer = torch.optim.Adam(get_trainable_params(model), lr=0.001)

# 训练和评估模型
train_loss = []
test_loss = []
for epoch in range(epochs):
    model.train()
    for inputs, targets in train_dl:
        inputs, targets = inputs.to(device), targets.to(device)
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = loss_fn(outputs, targets)
        loss.backward()
        optimizer.step()
        apply_mask(model, mask)  # 每次参数更新后应用掩码

    # 在测试集上评估
    model.eval()
    total_test_loss = 0
    with torch.no_grad():
        for inputs, targets in test_dl:
            inputs, targets = inputs.to(model.device), targets.to(model.device)
            outputs = model(inputs)
            loss_val = loss_fn(outputs, targets)
            total_test_loss += loss_val.item()

    epoch_test_loss = total_test_loss / len(test_dl)
    test_loss.append(epoch_test_loss)

    print(f'Epoch {epoch+1}: Train Loss: {loss.item()}, Test Loss: {epoch_test_loss}')

print('model_quantized_ih0_hh0_ih1 Done!')
# 保存量化模型
torch.save(model, save_path + 'model_quantized_ih0_hh0_ih1.pth')
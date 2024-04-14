import torch
import torch.nn as nn
from torch.quantization import quantize_dynamic
import numpy as np
from mydataloader import my_dataloder

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



def Q(a, levels=8):  
    a = a.to('cpu')
    b = a.detach().numpy()
    b = np.clip(b, -0.875, 0.875)  # 可以根据具体情况调整裁剪阈值
    b = np.round(b * levels + 0.5) / levels  # 调整量化级别
    a.data = torch.from_numpy(b).data
    return a



with torch.no_grad():
    model.rnn.weight_ih_l0 = Q(model.rnn.weight_ih_l0)
    model.rnn.bias_ih_l0 = Q(model.rnn.bias_ih_l0)
    model.rnn.weight_hh_l0 = Q(model.rnn.weight_hh_l0)


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
        if name not in ['rnn.weight_ih_l0','rnn.bias_ih_l0','rnn.weight_hh_l0']:
            yield param

# 使用自定义参数集配置优化器
loss_fn = nn.MSELoss()
optimizer = torch.optim.Adam(get_trainable_params(model), lr=0.001)

def train_epoch(model, dataloader, loss_fn, optimizer):
    model.train()
    total_loss = 0
    for inputs, targets in dataloader:
        inputs, targets = inputs.to(model.device), targets.to(model.device)
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = loss_fn(outputs, targets)
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
    return total_loss / len(dataloader)

def evaluate(model, dataloader, loss_fn):
    model.eval()
    total_loss = 0
    with torch.no_grad():
        for inputs, targets in dataloader:
            inputs, targets = inputs.to(model.device), targets.to(model.device)
            outputs = model(inputs)
            loss = loss_fn(outputs, targets)
            total_loss += loss.item()
    return total_loss / len(dataloader)

# 训练和评估模型
for epoch in range(epochs):
    train_loss = train_epoch(model, train_dl, loss_fn, optimizer)
    test_loss = evaluate(model, test_dl, loss_fn)
    print(f'Epoch {epoch+1}: Train Loss = {train_loss:.6f}, Test Loss = {test_loss:.6f}')




"""完成对bias的剪枝和训练"""
with torch.no_grad():
    model.rnn.weight_ih_l0 = Q(model.rnn.weight_ih_l0)
    model.rnn.bias_ih_l0 = Q(model.rnn.bias_ih_l0)
    model.rnn.bias_hh_l0 = Q(model.rnn.weight_hh_l0)
    model.rnn.bias_hh_l0 = Q(model.rnn.bias_hh_l0)


def get_trainable_params(model):
    for name, param in model.named_parameters():
        # 排除已经量化的参数
        if name not in ['rnn.weight_ih_l0','rnn.bias_ih_l0','rnn.weight_hh_l0','rnn.bias_hh_l0']:
            yield param

# 使用自定义参数集配置优化器
loss_fn = nn.MSELoss()
optimizer = torch.optim.Adam(get_trainable_params(model), lr=0.001)

# 训练和评估模型
for epoch in range(epochs):
    train_loss = train_epoch(model, train_dl, loss_fn, optimizer)
    test_loss = evaluate(model, test_dl, loss_fn)
    print(f'Epoch {epoch+1}: Train Loss = {train_loss:.6f}, Test Loss = {test_loss:.6f}')

# 保存量化模型
torch.save(model, save_path + 'model_quantized_ih0_hh0.pth')
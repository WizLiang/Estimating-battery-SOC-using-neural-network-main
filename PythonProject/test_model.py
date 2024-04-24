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
model_path = save_path + 'model_quantized_ih0_hh0_ih1_hh1_fc.pth'
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



'''测试模型'''


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
print(f"Test Loss : {test_loss}")


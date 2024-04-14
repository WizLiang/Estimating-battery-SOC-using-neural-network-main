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
epochs = 10
hidden_size = 32
num_layers = 2
input_size = train_x.shape[-1]

# 数据打包
train_dl, test_dl = my_dataloder(train_x, train_y, test_x, test_y, bs, shuffle=True)





# 加载剪枝并训练好的模型
model_path = save_path + 'model_pruning_Trained_32.pth'
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

#0.03303659606906699 -0.875, 0.875  level = 32
#Test Loss After quantization: 1.6927699100680467  level = 8

'''
def Q(a, levels=32):
    a = a.to('cpu')
    b = a.detach().numpy()
    min_b, max_b = b.min(), b.max()
    print("Min value:", min_b, "Max value:", max_b)
    # 动态调整范围到最小/最大值
    b = np.clip(b, min_b, max_b)
    range_b = max_b - min_b
    scale = levels / range_b
    b = np.round((b - min_b) * scale) / scale + min_b  # 重新映射到原始的最小值和最大值
    a.data = torch.from_numpy(b).data
    return a
'''

def apply_quantization_to_model(model):
    with torch.no_grad():  # 确保不计算梯度
        for name, param in model.named_parameters():
            quantized_param = Q(param)  # 应用量化函数
            param.data.copy_(quantized_param.data)  # 替换原始参数数据

# 假设 model 已经定义
apply_quantization_to_model(model)





'''保存，测试量化模型'''
# 保存量化模型
torch.save(model, save_path + 'model_quantized_all.pth')

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









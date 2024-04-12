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

# 应用动态量化
model_quantized = quantize_dynamic(
    model,  # 要量化的模型
    {nn.LSTM, nn.Linear},  # 指定要量化的模块类型
    dtype=torch.qint8  # 指定量化到的数据类型
)



'''保存，测试量化模型'''
# 保存量化模型
torch.save(model_quantized.state_dict(), save_path + 'model_quantized.pth')

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
print(f"Test Loss before quantization: {test_loss}")

test_loss = test_model(model_quantized, test_dl)
print(f"Test Loss after quantization: {test_loss}")


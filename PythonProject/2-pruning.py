
from pruning import topk
from pruning import apply_pruning_to_lstm

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from norm import norm
import torch
import torch.nn as nn
from torchviz import make_dot
from fit import fit
from split import split
from torchinfo import summary
from mydataloader import my_dataloder
from lsnet import LsNet
from vnet import Vnet
from lnet import LNet

# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'
seq_len = 30


"""
# 将本次训练的关键数据保存下来
np.save(save_path + 'norm_dict.npy', norm_dict)
np.save(save_path + 'xy_dict.npy', xy_dict)
"""

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

#选择要使用的模型 
#model = LsNet(hidden_size, input_size, num_layers)

model = torch.load(save_path + 'model.pth')




def evaluate(model, data_loader, loss_fn):
    model.eval()  # 设置模型为评估模式
    total_loss = 0.0
    total_count = 0

    with torch.no_grad():  # 在评估阶段，不需要计算梯度
        for inputs, targets in data_loader:
            inputs, targets = inputs.to(device), targets.to(device)
            outputs = model(inputs)
            loss = loss_fn(outputs, targets)
            total_loss += loss.item() * inputs.size(0)
            total_count += inputs.size(0)
    
    average_loss = total_loss / total_count
    return average_loss




# 设置学习方式
loss_fn = nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)
summary(model, input_size=(bs, seq_len, input_size))


device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)  # 确保模型在正确的设备上
test_loss = evaluate(model, test_dl, loss_fn)
print(f'LSTM Test Loss: {test_loss}')



#剪枝
apply_pruning_to_lstm(model.rnn, k=2) 


'''
# 训练
train_loss = []
test_loss = []
for epoch in range(epochs):
    epoch_loss, epoch_test_loss = fit(epoch, model, train_dl, test_dl, loss_fn, optimizer)
    train_loss.append(epoch_loss)
    test_loss.append(epoch_test_loss)
print('Done!')
'''

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

# 在剪枝后检查模型
check_pruning(model)


#测试剪枝后

#device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
#model.to(device)  # 确保模型在正确的设备上
test_loss = evaluate(model, test_dl, loss_fn)
print(f'LSTM_Pruning_Test Loss: {test_loss}')


"""
# 绘图
plt.figure(figsize=(12,4))
plt.subplot(121)
plt.title('train loss')
plt.plot(train_loss)
plt.subplot(122)
plt.title('validation loss')
plt.plot(test_loss)

plt.suptitle(" Model : LSTM ")

plt.show()
"""
# 保存训练结果
torch.save(model, save_path + 'model_pruning_32.pth')









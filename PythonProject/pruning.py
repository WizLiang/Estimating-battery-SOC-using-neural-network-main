'''top_k剪枝'''
import torch
'''
def topk(para, k):
    c = torch.zeros(para.size()[0], para.size()[1],dtype = torch.int)
    l = int(para.size()[1]/7)
    parameter = torch.abs(para)
    _, b = torch.topk(parameter[:,:7], k, 1, largest = True)
    for i in range(1,l):
        _, b1 = torch.topk(parameter[:,i*7:(i+1)*7], k, 1, largest = True)
        b1 = b1 + i * 7
        b = torch.cat((b,b1),dim=1)

    for j in range(c.size()[0]):
        c[j, b[j, :]] = 1
    return c
'''
def topk(para, k):
    c = torch.zeros(para.size()[0], para.size()[1],dtype = torch.int)
    l = int(para.size()[1]/4)
    parameter = torch.abs(para)
    _, b = torch.topk(parameter[:,:4], k, 1, largest = True)
    for i in range(1,l):
        _, b1 = torch.topk(parameter[:,i*4:(i+1)*4], k, 1, largest = True)
        b1 = b1 + i * 4
        b = torch.cat((b,b1),dim=1)

    for j in range(c.size()[0]):
        c[j, b[j, :]] = 1
    return c


def apply_pruning_to_lstm(lstm_module, k):
    # 对LSTM的所有权重矩阵进行剪枝
    for name, param in lstm_module.named_parameters():
        if "weight" in name:  # 确保只处理权重矩阵
            mask = topk(param.data, k)  # 生成掩码
            param.data.mul_(mask)  # 应用掩码，剪枝不重要的权重

"""
# 实例化模型
net = LsNet(hidden_size=64, input_size=2, num_layers=2)

# 假设我们想要在每个权重矩阵的每7个元素中保留最大的2个
k = 2

# 对LSTM层应用剪枝
apply_pruning_to_lstm(net.rnn, k)

# 注意：这种剪枝方法是永久性的。一旦执行，被置为0的权重将不会在训练过程中被更新。
# 如果需要可逆的剪枝或者想在训练过程中动态调整剪枝策略，请考虑使用更高级的库支持，如PyTorch的torch.nn.utils.prune模块。
"""


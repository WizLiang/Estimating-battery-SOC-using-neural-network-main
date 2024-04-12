import torch
# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'
#seq_len = 30

#torch.save(model, save_path + 'model.pth')
net= torch.load(save_path + 'model2.pth')
'''
print(type(net.fc))
print(net.fc.weight)#fc weight
'''

print(net.rnn)
print(net.rnn.__dict__)
#print(dir(net.rnn))
"""print(len(net))
for k in net.key():
    print(k)"""
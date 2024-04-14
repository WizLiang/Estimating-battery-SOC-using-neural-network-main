import torch
import numpy as np

# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'
#seq_len = 30

#torch.save(model, save_path + 'model.pth')
net= torch.load(save_path + 'model_quantized_ih0_hh0_ih1_hh1.pth')
'''
print(type(net.fc))
print(net.fc.weight)#fc weight
'''


print(net.fc.weight)
print(net.fc.bias)
print("\n")
#print(net.rnn._modules['_all_weight_values'][0].PackedParameter())
# 正确地访问 _all_weight_values

def Q(a, levels=256):  
    a = a.to('cpu')
    b = a.detach().numpy()
    b = np.clip(b, -0.875, 0.875)  # 可以根据具体情况调整裁剪阈值
    b = np.round(b * levels ) / levels  # 调整量化级别
    a.data = torch.from_numpy(b).data
    return a
import torch
import numpy as np

import torch
import numpy as np

''''''
def Q(a):  
    a = a.to('cpu')
    b = a.detach().numpy()
    b = np.round(b * 128)
    b = np.clip(b, -127, 127)
    b = b / 128
    a.data = torch.from_numpy(b).data
    return a


print(Q(net.fc.weight))
print(Q(net.fc.bias))



#print(dir(net.rnn))
"""print(len(net))
for k in net.key():
    print(k)"""
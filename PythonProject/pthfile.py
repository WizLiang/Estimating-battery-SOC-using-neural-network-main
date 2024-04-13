import torch
# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'
#seq_len = 30

#torch.save(model, save_path + 'model.pth')
net= torch.load(save_path + 'model_quantized.pth')
'''
print(type(net.fc))
print(net.fc.weight)#fc weight
'''


print(net.rnn._modules)
print("\n")
#print(net.rnn._modules['_all_weight_values'][0].PackedParameter())
# 正确地访问 _all_weight_values

packed_params = net.rnn._modules['_all_weight_values'][0]

# 尝试解包
# 注意: 这里的具体函数可能需要根据你的PyTorch版本和模型类型调整
unpacked_params = torch.ops.quantized.lstm_unpack(packed_params, num_layers=2, input_size=2, hidden_size=32)

# 打印解包后的权重
print("Weights:", unpacked_params)


#print(dir(net.rnn))
"""print(len(net))
for k in net.key():
    print(k)"""
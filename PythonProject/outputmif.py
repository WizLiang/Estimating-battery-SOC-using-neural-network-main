import torch
import numpy as np

# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'
# 加载量化模型
#model = torch.load('save_path/model_quantized.pth')
model_quantized = torch.load(save_path+'model_quantized.pth')

model_quantized.eval()

print(model_quantized)
print(model_quantized.rnn)


print("LSTM Weights and Biases:")
for name, param in model_quantized.rnn.named_parameters():
    print(f"{name}: {param.size()}")

# 打印 Linear 层的参数
print("Linear Weights and Biases:")
for name, param in model_quantized.fc.named_parameters():
    print(f"{name}: {param.size()}")

'''
# 例如，打印出权重的键，以便了解要访问的权重
# 访问 LSTM 层的权重
for name, param in model_quantized.rnn.named_parameters():
    print(name, param.size())  # 打印参数名和尺寸，帮助确定要导出的权重
'''


# 根据实际情况选择正确的键

'''
weight_key = 'rnn.weight_ih_l0'  # 假设我们要提取的权重
weights = model[weight_key].numpy()  # 将权重转换为NumPy数组


"""创建一个 .mif 文件，并按照文件格式要求写入数据。.mif 文件通常需要指定宽度、深度和数据内容"""

def write_to_mif(filename, data):
    depth = data.size  # 数据的总元素数量
    width = data.itemsize * 8  # 每个数据元素的位宽，此处假设所有数据都是单字节的

    with open(filename, 'w') as file:
        file.write(f"WIDTH={width};\n")
        file.write(f"DEPTH={depth};\n")
        file.write("ADDRESS_RADIX=HEX;\n")
        file.write("DATA_RADIX=HEX;\n")
        file.write("CONTENT BEGIN\n")
        
        # 写入每个数据元素
        for i in range(depth):
            data_value = data.flat[i]
            file.write(f"{i:04X} : {data_value:02X};\n")
        
        file.write("END;\n")

# 调用函数写入MIF文件
write_to_mif(save_path + weight_key + 'mif', weights)

'''
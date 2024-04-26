import torch
import numpy as np


# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'

#模型加载
model_path = save_path + 'model_quantized_ih0_hh0_ih1_hh1_fc.pth'
model = torch.load(model_path)
model.eval()

wide_m = 0
wide_f = 7


def p_d2b(n, m, f): #将一个10进制正数转换为一个2进制数，保留m位整数，f位小数，首位符号位
    b = []
    x = 2
    n = n * np.power(2, f)
    n = int(n)
    while True:
        s = n // x
        y = n % x
        b = b + [y]
        if s == 0:
            break
        n = s
    b.reverse()
    if(len(b) > (m+f)):
        for i in range(m+f):
            b[i] = 1
            b = b[:m+f]
    elif(len(b) < (m+f)):
        for i in range(m+f-len(b)):
            b.insert(0,0)
    b.insert(0,0)
    a = [str(i) for i in b ]
    return a

def n_d2b(n, m, f): #求一个10进制负数转换为一个2进制补码形式，保留m位整数，f位小数，首位符号位
    n = -1 * n
    b = p_d2b(n, m, f)
    b[0] = '1'
    flag = 1
    for i in range(len(b)-1,0,-1):
        if b[i]== '1' and flag == 1:
            b[i] = '1'
            flag = 0
        elif b[i] == '0' and flag == 1:
            b[i] = '0'
            flag = 1
        elif b[i] == '0':
            b[i] = '1'
        else:
            b[i] = '0'
    a = [str(i) for i in b ]
    return a

def d2b(n, m, f): #求一个数n的补码，保留m位整数，n位小数，首位符号位
    if n < 0:
        c = n_d2b(n, m, f)
    else:
        c = p_d2b(n, m, f)
    return c


# 输出到COE文件
def output_to_coe(weight, filename):
    global wide_m,wide_f
    f = open(filename + ".coe", "w")
    data = 'memory_initialization_radix=2;\nmemory_initialization_vector=\n'
    f.write(data)
    # 获取权重数据并转换为numpy数组（如果还不是）
    para = weight.detach().numpy()
        # 遍历每一行权重
    for i in range(para.shape[0]):
        # 拼接当前行的二维数据
        combined_binary = ''  # 初始化拼接字符串
        for j in range(para.shape[1]):  # 遍历第二维的每个元素
            binary_value = ''.join(d2b(para[i, j], wide_m, wide_f))  # 转换为二进制
            combined_binary += binary_value  # 拼接二进制值
        f.write(combined_binary + ',\n')  # 写入拼接后的整行数据
        #binary_high = ''.join(d2b(para[i, 0], 1, 6))  # 高8位
        #binary_low = ''.join(d2b(para[i, 1], 1, 6))  # 低8位
        #combined_binary = binary_high + binary_low  # 拼接
        #f.write(combined_binary + ',\n')

    f.write(';')
    f.close()


# 输出到COE文件
def output_to_coe1(weight, filename):
    global wide_m,wide_f
    f = open(filename + ".coe", "w")
    data = 'memory_initialization_radix=2;\nmemory_initialization_vector=\n'
    f.write(data)
    # 获取权重数据并转换为numpy数组（如果还不是）
    para = weight.detach().numpy()
        # 遍历每一行权重
    for i in range(para.shape[0]):
        # 拼接当前行的二维数据
        combined_binary = ''  # 初始化拼接字符串

        
        combined_binary = ''.join(d2b(para[i], wide_m, wide_f))
        f.write(combined_binary + ',\n')  # 写入拼接后的整行数据

    f.write(';')
    f.close()

#print(model.rnn.weight_ih_l0)
#para = model.rnn.weight_ih_l0.detach().numpy()
#print(d2b(para[0, 0], 1, 6))


output_to_coe(model.rnn.weight_ih_l0, save_path + 'coe/lstm_weight_ih_l0')
output_to_coe1(model.rnn.bias_ih_l0, save_path + 'coe/lstm_bias_ih_l0')
output_to_coe(model.rnn.weight_hh_l0, save_path + 'coe/lstm_weight_hh_l0')
output_to_coe1(model.rnn.bias_hh_l0, save_path + 'coe/lstm_bias_hh_l0')

output_to_coe(model.rnn.weight_ih_l1, save_path + 'coe/lstm_weight_ih_l1')
output_to_coe1(model.rnn.bias_ih_l1, save_path + 'coe/lstm_bias_ih_l1')
output_to_coe(model.rnn.weight_hh_l1, save_path + 'coe/lstm_weight_hh_l1')
output_to_coe1(model.rnn.bias_hh_l1, save_path + 'coe/lstm_bias_hh_l1')

output_to_coe(model.fc.weight, save_path + 'coe/lstm_weight_fc')
output_to_coe1(model.fc.bias, save_path + 'coe/lstm_bias_fc')





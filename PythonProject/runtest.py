import numpy as np
import torch


# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'

#模型加载
model_path = save_path + 'model_quantized_ih0_hh0_ih1_hh1_fc.pth'
model = torch.load(model_path)
model.eval()

'''
# 检查权重和偏置
def check_parameters(model):
    count = 0
    for param in model.parameters():
        # 检查每个参数的绝对值是否大于1
        count += torch.sum(torch.abs(param) > 1).item()
    return count

# 运行检查并输出结果
num_exceeding = check_parameters(model)
print(f"Number of parameters with absolute value > 1: {num_exceeding}")'''

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


print(d2b(0.2031,0,7))


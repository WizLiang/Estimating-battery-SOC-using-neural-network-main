import torch
import numpy as np

# 定义文件存放路径
data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'
# 加载量化模型
#model = torch.load('save_path/model_quantized.pth')
state_dict = torch.load(save_path+'model_quantized.pth')
'''
lstm_weight = model.state_dict()['rnn.weight_ih_l']
lstm_bias = model.state_dict()['rnn.bias_ih_l']
fc_weight = model.state_dict()['fc.weight']
fc_bias = model.state_dict()['fc.bias']
'''
'''
#lstm weigh reading
#num = 0
lstm_weight_ih_l0 = model.state_dict()['rnn.weight_ih_l0']
lstm_weight_hh_l0 = model.state_dict()['rnn.weight_hh_l0']
lstm_bias_ih_l0 = model.state_dict()['rnn.bias_ih_l0']
lstm_bias_hh_l0 = model.state_dict()['rnn.bias_hh_l0']

#num = 1

lstm_weight_ih_l1 = model.state_dict()['rnn.weight_ih_l1']
lstm_weight_hh_l1 = model.state_dict()['rnn.weight_hh_l1']
lstm_bias_ih_l1 = model.state_dict()['rnn.bias_ih_l1']
lstm_bias_hh_l1 = model.state_dict()['rnn.bias_hh_l1']

#fc
fc_weight = model.state_dict()['fc.weight']
fc_bias = model.state_dict()['fc.bias']

'''
# 遍历模型权重
for name, weight in state_dict.items():
    print(f"Layer: {name}")


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




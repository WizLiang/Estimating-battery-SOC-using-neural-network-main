from scipy.interpolate import interp1d
import matplotlib.pyplot as plt
import numpy as np
import math
#arange()函数用于生成一组数，包括起始值，不包括终点值，默认间隔为1，生成的数格式为array.
x = np.arange(0,4,0.125)
def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def tanh(x):
    return np.tanh(x)

y = [tanh(i) for i in x]
f = interp1d(x, y,kind = 'linear')

#
x_new = np.arange(0,4,0.125)

y_new = f(x_new) #使用函数根据x_new进行插值

def line_equation(x1, y1, x2, y2):
    # 计算斜率
    k = (y2 - y1) / (x2 - x1)
    # 计算截距
    b = y1 - k * x1
    return k, b

# for i in range(len(x_new))
#     (print(i))
k_b = [(line_equation(x_new[i],y_new[i],x_new[i+1],y_new[i+1])) for i in range(len(x_new)-1)]
print(k_b)
# k, b = np.split(k_b, 2, axis=1)
# print(k)
k,b = (zip(*k_b))
#k=[round(k*512) for k in k]  #sigmoid
k=[round(k*128) for k in k] #tanh
# dec_num=round(k)
print(k)
k=[bin(k)[2:] for k in k]


for i in range(len(k)):
    print(f"assign romk[{i}] = 'b{k[i]};")

#b=[round(b*256) for b in b] #sigmoid
b=[round(b*128) for b in b] #tanh
print(b)
b=[bin(b)[2:] for b in b]

for i in range(len(b)):
    print(f"assign romb[{i}] = 'b{b[i]};")




print(len(k_b))

print(sigmoid(1.21875))
print(sigmoid(2.453))
print(sigmoid(0.2))
print(tanh(2.531))
# 打印分割后的数组形状


# print(len(k_b))
plt.plot(x, y, 'b-', x_new, y_new, 'ro')#原始点为蓝色线条，插值点为红色圆点
plt.show()
# print(y_new)

from scipy.interpolate import interp1d
import matplotlib.pyplot as plt
import numpy as np

# 生成x值数组
x = np.arange(0, 4, 0.125)
def tanh(x):
    return np.tanh(x)

# 计算原始tanh函数的y值
y = [tanh(i) for i in x]

# 创建线性插值函数
f = interp1d(x, y, kind='linear')

def line_equation(x1, y1, x2, y2):
    # 计算斜率
    k = (y2 - y1) / (x2 - x1)
    # 计算截距
    b = y1 - k * x1
    return k, b

# 现在根据计算出的斜率k和截距b，绘制每段的线性插值
x_segments = np.arange(0, 4, 0.125)
k, b = zip(*[(line_equation(x_segments[i], y[i], x_segments[i+1], y[i+1])) for i in range(len(x_segments)-1)])

# 绘制原始数据点和插值点
plt.plot(x, y, 'b-', label='Original tanh')
plt.plot(x, f(x), 'ro', label='Interpolation points')

# 用分段线性函数绘制每个区间
for i in range(len(k)):
    # 在每个区间内生成更多点以绘制线性部分
    xs = np.linspace(x_segments[i], x_segments[i+1], 10)
    ys = k[i] * xs + b[i]
    plt.plot(xs, ys, 'g-')

# 添加图例
plt.legend()

# 显示图表
plt.show()

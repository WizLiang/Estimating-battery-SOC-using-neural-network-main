import numpy as np

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

print(p_d2b(108,8,0))



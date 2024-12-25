# 项目概述
这是我的本科毕设，由于需要准备复试，留给复试的时间不多。在两个月不到的时间里面学习了python语法，ML和LSTM的基础知识，使用了LSTM、VGG16和FC对电池电量进行了分析。
完成了LSTM的剪枝和量化
预设是从LSTM的训练到硬件实现都完成，但是后面由于设备还有时间的限制，最后仅仅完成LSTM各个部分实现(rom,relu等激活函数的实现)还有仿真，乘法器优化之后出现BUG。

## Estimating-battery-SOC-using-neural-network
使用神经网络估计电池剩余电量  
提供三个可用的模型，分别是LSTM网络、VGG16网络和全连接网络。  
然后对LSTM进行了剪枝、量化。采用了分层量化重训练的操作....
关于量化的结果、量化的数据类型和量化的方法，代码里面有写..,赶着期末考试，有空补。

## FPGA 
文件夹里面有各个部分的实现，ROM,激活函数的拟合等等。
大那是乘法器的实现有问题，我之前串起来过，但是发现需要用到的资源太多，所以对乘法器进行了优化，然后就出BUG了...

# 参考资料
## 参考文献
【参考文献】
[1]	ZHENG F, XING Y, JIANG J, 等. Influence of different open circuit voltage tests on state of charge online estimation for lithium-ion batteries[J/OL]. Applied Energy, 2016, 183: 513-525. DOI:10.1016/j.apenergy.2016.09.010.
[2]	FULLER T F, DOYLE M, NEWMAN J. Simulation and Optimization of the Dual Lithium Ion Insertion Cell[J/OL]. Journal of The Electrochemical Society, 1994, 141(1): 1-10. DOI:10.1149/1.2054684.
[3]	高明煜,何志伟,徐杰. 基于采样点卡尔曼滤波的动力电池SOC估计[J]. 电工技术学报,2011,26(11):161-167.
[4]	ALVAREZ ANTON J C, GARCIA NIETO P J, DE COS JUEZ F J, 等. Battery state-of-charge estimator using the SVM technique[J/OL]. APPLIED MATHEMATICAL MODELLING, 2013, 37(9): 6244-6253. DOI:10.1016/j.apm.2013.01.024.
[5]	HE W, WILLIARD N, CHEN C, 等. State of charge estimation for Li-ion batteries using neural network modeling and unscented Kalman filter-based error cancellation[J/OL]. International Journal of Electrical Power & Energy Systems, 2014, 62: 783-791. DOI:10.1016/j.ijepes.2014.04.059.
[6]	ELMAN J L. Finding Structure in Time[J/OL]. Cognitive Science, 1990, 14(2): 179-211. DOI:10.1207/s15516709cog1402_1.
[7]	Understanding LSTM Networks -- colah’s blog[EB/OL]. [2024-04-15]. https://colah.github.io/posts/2015-08-Understanding-LSTMs/.
[8]	HAN S, KANG J, MAO H, 等. ESE: Efficient Speech Recognition Engine with Sparse LSTM on FPGA[C/OL]/2017: 75-84[2024-04-17]. DOI:10.1145/3020078.3021745.
[9]	ZHU, X. Interactive Search and Summarization on Hierarchical Graphs[EB/OL] 25 Sept 2023
[10]	WANG M, WANG Z, LU J, 等. E-LSTM: An Efficient Hardware Architecture for Long Short-Term Memory[J/OL]. IEEE Journal on Emerging and Selected Topics in Circuits and Systems, 2019, 9(2): 280-291. DOI:10.1109/JETCAS.2019.2911739.

## 数据集相关资料
文档下载来源：  
https://www.ti.com.cn  
数据下载来源：  
https://calce.umd.edu/battery-data

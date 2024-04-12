import torch
from torchviz import make_dot
from lsnet import LsNet


seq_len = 30
bs = 128
epochs = 10
hidden_size = 32
num_layers = 2
#input_size = train_x.shape[-1]
input_size = 2


# 假设你的模型实例化为 model
model = LsNet(hidden_size, input_size, num_layers)

# 生成一个随机输入，以匹配模型的输入维度
# 注意：你需要根据你的模型具体输入来调整这里的维度
dummy_input = torch.randn(bs, seq_len, input_size)

# 将模型设置为评估模式
model.eval()

# 通过模型传递dummy_input来获取输出
# 需要保证dummy_input的设备（CPU或GPU）与模型一致
output = model(dummy_input)

# 使用make_dot从输出生成计算图
# params=dict(model.named_parameters())用于将模型参数的名字也包括在内，使图表更加详细
vis_graph = make_dot(output, params=dict(model.named_parameters()))

# 渲染图表并保存为PDF或PNG
vis_graph.render('model_32_structure', format='png')


import torch
import torch.nn as nn
import torch.nn.functional as F
'''hidden_size = 64
num_layers = 2
input_size = 2'''

class LsNet(nn.Module):
    """LSTM网络"""
    def __init__(self, hidden_size, input_size, num_layers,device=None):
        super(LsNet, self).__init__()
        self.num_layers = num_layers
        self.hidden_size = hidden_size
        self.rnn = nn.LSTM(hidden_size = hidden_size,
                           input_size = input_size,
                           num_layers = num_layers,
                           batch_first = True)
        self.device = device or torch.device("cuda" if torch.cuda.is_available() else "cpu")
        #self.fc1 = nn.Linear(hidden_size, 64)
        #self.fc2 = nn.Linear(64, 1)
        self.fc = nn.Linear(hidden_size, 1)
        self.to(self.device)#将模型的所有参数和缓冲区移动到指定设备

    def forward(self, inputs):
        h0 = torch.zeros(self.num_layers, inputs.size(0), self.hidden_size).to(inputs.device)
        c0 = torch.zeros(self.num_layers, inputs.size(0), self.hidden_size).to(inputs.device)
        s_o, _ = self.rnn(inputs, (h0, c0))
        s_o = s_o[:, -1, :]
        #x = F.dropout(F.relu(self.fc1(s_o)))
        x = self.fc(s_o)
        return torch.squeeze(x)
        #return x
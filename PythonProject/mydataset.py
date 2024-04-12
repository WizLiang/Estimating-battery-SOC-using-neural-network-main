import torch.utils.data

class Mydataset(torch.utils.data.Dataset):

    """
    TensorDataset继承Dataset, 重载了__init__(), __getitem__(), __len__()
    实现将一组Tensor数据对封装成Tensor数据集
    能够通过index得到数据集的数据，能够通过len，得到数据集大小
    """
    """输入x,y,返回ds"""
    def __init__(self, features, labels):
        self.features = features
        self.labels = labels
    def __getitem__(self, item):
        return self.features[item], self.labels[item]
    def __len__(self):
        return len(self.features)
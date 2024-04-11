import numpy as np

data_path = "d:\Desktop\Estimating-battery-SOC-using-neural-network-main\data/"
save_path = 'd:\Desktop\Estimating-battery-SOC-using-neural-network-main\save/'

"""np.save(save_path + 'norm_dict.npy', norm_dict)
np.save(save_path + 'xy_dict.npy', xy_dict)"""

test = np.load(save_path+'xy_dict.npy',allow_pickle=True)

print(test)
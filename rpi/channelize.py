import matplotlib.pyplot as plt
from scipy.signal import chirp, spectrogram
from scipy.fftpack import fftshift
import numpy as np
from array import array
import spidev
import time

# def synthetic_signal():
#     ### Signal parameters
#     fs = 16e3
#     f1 = 200
#     pi = np.pi
#     samp_per_period = int(np.ceil(fs/f1) - 1)
#     t = np.linspace(0.0, samp_per_period/fs, num=samp_per_period)  # Create a list of evenly-spaced numbers over the range
#     sig = np.cos(2*pi*f1*t)
#     plt.plot(t,sig)
#     plt.show()
#     plt.title("Generated signal")
#     return np.int16(sig)

#=== Read Signal out of file ===
def read_signal_file(filename):
    with open(filename, "rb") as binaryfile :
        myArr = bytearray(binaryfile.read())
    
    return myArr

def openSPI(max_speed_hz, mode):
    spi = spidev.SpiDev(0,0)
    # spi.open(0,1)
    # spi.cshigh = False
    spi.max_speed_hz = max_speed_hz
    # spi.mode = mode
    return spi


#=== Read signal from file
filename = "filtIn_3_8001.iq8"
IQ = read_signal_file(filename)
BUS_SPEED = 96000
SLEEP_LENGTH = 0.01
print("Done Loading, going to start spitting")

L = len(IQ)
L= 128+32
t = list(range(0,int(L/8)))
Y = []
X = []
spi = openSPI(BUS_SPEED,0)

# With xfer2 we dont loop, it should handle the releases for us 
subset_IQ = IQ[0:L]
print("length of subsetIQ: ",len(subset_IQ))
r = spi.xfer3(subset_IQ)

for i in range(0, L):
    print(i,":","Sent ", np.int8(subset_IQ[i]), "   \trecieved: ", np.int8(r[i]))
# convert to int8

x_re = r[0:L:2]
x_im = r[1:L:2]

x_0_re = x_re[0:len(x_re):8]
print("length of x: ",len(X))
print("length of x0_re: ",len(x_0_re))

t = list(range(0,int(len(x_im)/8)))

figI, axs = plt.subplots(8, 1, sharex=True, sharey=True)
ch_num = int(0)
for ax in axs.flat:
    ax.plot(t,np.int8(x_re[ch_num:len(x_re):8]))
    title_str = "Ch " + str(ch_num)
    ax.set_ylabel(title_str)
    ax.grid()
    plt.ylim(-128,127)
    ch_num = ch_num + 1

figI.suptitle('In Phase', fontsize=16)
plt.ylim(-128,127)

figQ, axs = plt.subplots(8, 1, sharex=True, sharey=True)
ch_num = int(0)
for ax in axs.flat:
    ax.plot(t,np.int8(x_im[ch_num:len(x_im):8]),color='orange')
    title_str = "Ch " + str(ch_num)
    ax.set_ylabel(title_str)
    ax.grid()
    ch_num = ch_num + 1

plt.ylim(-128,127)
figQ.suptitle('Quadrature', fontsize=16)

# fig, ((ax0, ax1), (ax2, ax3)) = plt.subplots(1, 2)
# # fig.suptitle('Sharing x per column, y per row')
# ax0.plot(t, np.int8(x_re[0:len(x_re):8]))
# ax1.plot(t, np.int8(x_im[1:len(x_re):8]))
# ax2.plot(t, np.int8(x_re[2:len(x_re):8]))
# ax3.plot(t, np.int8(x_re[3:len(x_re):8]))
# for ax in fig.get_axes():
#     ax.label_outer()

plt.show()


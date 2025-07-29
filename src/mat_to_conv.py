
from PIL import Image
import numpy as np
import cocotb


@cocotb.test()
async def conv_test(dut):

    D = 640 #
    K = 3   #

    with open("conf/mat_to_conv_input.bin", "rb") as f:
        line = np.frombuffer(f.read(), dtype=np.uint8)

    kernel = np.array([1, 0, -1], dtype=np.int8)

    for i in range(D):
        dut.data[i].value = int(line[i])

    for i in range(K):
        dut.kernel[i].value = int(kernel[i])

    await cocotb.triggers.Timer(1, units='ns')

    result = []
    for i in range(D):
        result.append(int(dut.result[i].value))

    img = Image.fromarray(np.array(result, dtype=np.uint8).reshape((1, -1)), mode='L')
    img.save("img/output.png")

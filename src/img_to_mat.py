
import sys
from PIL import Image
import numpy as np

img_path = sys.argv[1]

img = Image.open(img_path).convert('L')

img_np = np.array(img)

first_line = img_np[0] 

with open("conf/mat_to_conv_input.bin", "wb") as f:
    f.write(first_line.tobytes())

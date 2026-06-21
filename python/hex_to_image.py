from PIL import Image
import numpy as np
import sys

print(sys.executable)

# ---------------------------------------------------
# Image Size
# ---------------------------------------------------
WIDTH = 694
HEIGHT = 398

# ---------------------------------------------------
# Read HEX file
# ---------------------------------------------------
def read_hex(filename):

    with open(filename, "r") as f:
        data = [int(line.strip(),16) for line in f]

    return np.array(data,dtype=np.uint8)

# ---------------------------------------------------
# Read RGB Channels
# ---------------------------------------------------
R = read_hex("enhanced_red.hex")
G = read_hex("enhanced_green.hex")
B = read_hex("enhanced_blue.hex")

# ---------------------------------------------------
# Verify pixel count
# ---------------------------------------------------
expected = WIDTH*HEIGHT

print("Expected Pixels :", expected)
print("Red   :", len(R))
print("Green :", len(G))
print("Blue  :", len(B))

assert len(R)==expected
assert len(G)==expected
assert len(B)==expected

# ---------------------------------------------------
# Reshape
# ---------------------------------------------------
R = R.reshape((HEIGHT,WIDTH))
G = G.reshape((HEIGHT,WIDTH))
B = B.reshape((HEIGHT,WIDTH))

# ---------------------------------------------------
# Merge
# ---------------------------------------------------
rgb = np.dstack((R,G,B))

img = Image.fromarray(rgb)

img.save("enhanced_output.png")

print("Image saved successfully!")
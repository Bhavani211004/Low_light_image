MAX_DEN = 180224
SCALE = 1 << 32      # 2^32 (Q0.32 fixed-point)

with open("reciprocal_lut.mem", "w") as f:

    # Address 0 (divide-by-zero protection)
    f.write("00000000\n")

    for d in range(1, MAX_DEN + 1):

        value = round(SCALE / d)

        # Saturate to 32 bits
        if value > 0xFFFFFFFF:
            value = 0xFFFFFFFF

        f.write("{:08X}\n".format(value))

print("reciprocal_lut.mem generated successfully!")
print("Entries =", MAX_DEN + 1)

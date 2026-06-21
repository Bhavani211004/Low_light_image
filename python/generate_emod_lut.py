import math

with open("emod.mem", "w") as f:
    for fm in range(256):

        # Normalize Fm
        fnorm = fm / 255.0

        # Equation (11)
        emod = math.sqrt(fnorm * (2.0 - fnorm))

        # Convert to Q8.8
        emod_q8 = round(emod * 256)

        f.write("{:04X}\n".format(emod_q8))

print("emod.mem generated successfully!")
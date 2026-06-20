with open("reciprocal_fm.mem","w") as f:

    for fm in range(256):

        if fm == 0:
            reciprocal = 0
        else:
            reciprocal = round((1<<16)/fm)

        f.write("{:08X}\n".format(reciprocal))

print("reciprocal_fm.mem generated successfully!")

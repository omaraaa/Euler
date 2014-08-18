a = 0
b = 1
c = 2

maxA = 333
maxB = 500
maxC = 1000

found = False

for a in range(0, maxA):
    for b in range(a+1, maxB):
        for c in range(b+1, maxC):
            if(a**2 + b**2 == c**2):
                print(str(a)+"**2" + " + " + str(b)+"**2 = "+str(c)+"**2")
                if(a + b + c == 1000):
                    r = a * b * c
                    found = True
                    break
        if(found):
            break
    if(found):
        break







    


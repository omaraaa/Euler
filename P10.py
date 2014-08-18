import math

below = 2000000
primeList = [2]

for i in range(3, below):
    if(i%2 == 0):
        continue
    if(i%3 == 0 and i!=3):
        continue
    #print(i)
    for o in primeList:
        if(o > math.sqrt(i)):
            primeList.append(i)
            break
        if(i%o == 0):
            break
print(sum(primeList))

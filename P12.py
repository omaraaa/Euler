import math

t = 1;
tNum=0
while True:
    count = 0
    tNum = 0
    for i in range(1, t):
        tNum += i
    for q in range(1, int(tNum**0.5)+1):
        if(tNum%q==0):
            if(q==int(tNum**0.5)+1):
                count+=1
            count+=2
        if(count>500):
            break
    if(count>500):
        break
    t+=1
    ##print(count)

import time
import math
file = open("t", 'r+')
i = 3
s = [2,3]
prime = False
while True:
        i += 2
        if(all((i%x!=0)for x in range(2,int(i**0.5)+1))):
               s.append(i)
        
        print(str(len(s)))
        if(len(s) >= 10001):
                break

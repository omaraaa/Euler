i = 1
count = 0
maxC = 0
result = 0
loop = False
while i < 1000000:
    #print(i)
    loop = False
    n = i
    count = 0
    l = []
    l.append(n)
    while n > 0 and not loop:
        ##print(n)
        
        if(n%2==0):
            n = n/2
            count += 1
        else:
            n = (3*n) + 1
            count += 1
        for check in l:
            if(n == check):
                loop = True

        if(not loop):
            l.append(n)
    if(len(l) > maxC):
         maxC = len(l)
         result = i
    i+=1

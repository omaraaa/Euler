grid = 20

l = [i for i in range(0, (grid+1)*(grid+1))]

n = 1

for i in l:
    if(n < grid+2):
        l[n-1] = 1
    elif((n-1)%(grid+1)==0):
        l[n-1] = 1
    else:
        l[n-1] = l[n-2] + l[(n-1)-(grid+1)]
    if(n == len(l)):
        print(l[n-1])
        break
    n+=1


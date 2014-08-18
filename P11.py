f = open('input.txt', 'r')
s = f.read()
l = s.split()
gridW = 20
gridH = 20
r = 0
m = 0
a = list(map(int, l))
for i in range(0, gridW*gridH):
    if(i/20 >= 3):
        r = a[i] * a[i-20] * a[i-(20*2)] * a[i-(20*3)]
        #print(str(r)+ " u " + str(i) + " " + str(a[i-(20*3)]))
        if(r > m):
           # print(str(r)+ " up " + str(i))
            m = r

    if(i/20 < 17):
        r = a[i] * a[i+20] * a[i+(20*2)] * a[i+(20*3)]
        #print(str(r)+ " d " + str(i) + " " + str(a[i]))
        if(r > m):
        #    print(str(r)+ " d " + str(i) + " " + str(a[i]))
            m = r

    if(((i-(20*int(i/20)))/20)*100 > 10):
        r = a[i] * a[i-1] * a[i-2] * a[i-3]
        #print(str(r)+ " l " + str(i) + " " + str(a[i]))
        if(r > m):
           # print(str(r)+ " l " + str(i))
            m = r

    if(((i-(20*int(i/20)))/20)*100 < 85):
        r = a[i] * a[i+1] * a[i+2] * a[i+3]
        #print(str(r)+ " r " + str(i) + " " + str(a[i]))
        if(r > m):
            #print(str(r)+ " r " + str(i))
            m = r

    if( (i/20 < 17) and (((i-(20*int(i/20)))/20)*100 < 85) ):
        r = a[i] * a[i+21] * a[i+42] * a[i+63]
        #print(str(r)+ " dia " + str(i) + " " + str(a[i]))
        if(r > m):
            #print(str(r)+ " dia " + str(i))
            m = r

    if( (i/20 >= 3) and (((i-(20*int(i/20)))/20)*100 > 10) ):
        r = a[i] * a[i-19] * a[i-38] * a[i-57]
        #print(str(r)+ " dia " + str(i) + " " + str(a[i]))
        if(r > m):
            #print(str(r)+ " dia " + str(i))
            m = r


print(m)
        

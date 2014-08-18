from operator import itemgetter, attrgetter
f = open('input3.txt', 'r')
data = f.read()
l = data.split('\n')
ls = []
for i in l:
    ls.append(i.split())

c = 0
for s in ls:
    s = list(map(int,s))
    ls[c] = s
    c+=1
paths = []
maxY = 15
ans = 0
def node(path):
    y = path[20]
    x = path[21]
    avrg = path[22]
    num = ls[y][x]
    n1 = ls[y+1][x]
    n2 = ls[y+1][x+1]
    d1 = n1 - num
    d2 = n2 - num
    if(y == 0):
        avrg = 0
        a1 = d1
        a2 = d2
    if(y != 0):
        a1 = float(((avrg/(y))+d1)/(y+1))
        a2 = float(((avrg/(y))+d2)/(y+1))
    global paths
    p1 = list(path)
    p1[y+1] = n1
    p1[20] = y+1
    p1[21] = x
    p1[22] = a1
    p2 = list(path)
    p2[y+1] = n2
    p2[20] = y+1
    p2[21] = x+1
    p2[22] = a2
    if(p1[22]>=p2[22]):
        path = p1
        paths.append(p2)
    else:
        path = p2
        paths.append(p1)
    return path
        


xx = 0
yy = 0
p = [0 for i in range(0,23)]
p[0] = ls[0][0]
paths.append(p)
while yy < 13:
    paths = sorted(paths, key=itemgetter(22), reverse = True)
    yy = paths[0][20]
    paths[0] = node(paths[0])
    


from operator import itemgetter, attrgetter
import copy
f = open('P18input.txt', 'r')
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

class path:
    x = 0
    y = 0
    l = []
    sum = 0
    p = 0
    combinedSum = 0
    maxP = 99
    global ls
    maxY = len(ls)
    done = False
    def __init__(self, xx, yy, ll):
        self.x = xx
        self.y = yy
        self.l = ll
        self.sum = sum(self.l)
        self.p = (self.maxY-self.y)*self.maxP
        self.combinedSum = self.sum + self.p
    def addPath(self, xx, yy, num):
        self.x = xx
        self.y = yy
        self.l.append(num)
        self.sum = sum(self.l)
        self.p = (self.maxY-self.y)*self.maxP
        self.combinedSum = self.sum + self.p

xx = 1
yy = 1
l = ls[yy-1]
p = path(xx, yy, l)
paths.append(p)
def checkP(pth):
    if(pth.y < pth.maxY):
        x = pth.x
        y = pth.y
        #print(y, " y ")
        #print(x, " x ")
        n1 = ls[y][x-1]
        n2 = ls[y][x]
        p1 = copy.deepcopy(pth)
        p2 = copy.deepcopy(pth)
        p1.addPath(x, y+1, n1)
        p2.addPath(x+1, y+1, n2)
        if(p1.combinedSum > p2.combinedSum):
            pth.addPath(x, y+1, n1)
            paths.append(p2)
        else:
            pth.addPath(x+1, y+1, n2)
            paths.append(p1)
    else:
        pth.done = True

done = False
count = 0
while not done:
    paths = sorted(paths, key=lambda x: x.combinedSum, reverse = True)
    checkP(paths[0])
    if(paths[0].done):
        done = True
    count += 1
    #print(count, " tick " )

print(paths[0].sum) 



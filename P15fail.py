
def node(x, y, tx, ty):
    if(x == tx or y == ty):
        global count
        count += 1
    if( x != tx and y != ty):
        node(x+1, y, tx, ty)
        node(x, y+1, tx, ty)

t = []
count = 0
print("node(0,0,t,xsize, ysize)")

f = open('input2.txt', 'r')
s = f.read()
ol = s.split('\n')
##l = ''.join(ol)
numL = map(int, ol)
'''
for digit in l:
    numL.append(int(digit))
'''
r = 0

for i in numL:
    r = r+i

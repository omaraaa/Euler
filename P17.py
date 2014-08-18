

def nTw(num):
    if(num == 0):
        return 0
    if(num < 20):
        return {
            1 : 3,
            2 : 3,
            3 : 5,
            4 : 4,
            5 : 4,
            6:3,
            7:5,
            8:5,
            9:4,
            10:3,
            11:6,
            12:6,
            13:8,
            14:8,
            15:7,
            16:7,
            17:9,
            18:8,
            19:8
            }[num]
    if(num > 19 and num < 100):

        lTens = {
            20:6,
            30:6,
            40:5,
            50:5,
            60:5,
            70:7,
            80:6,
            90:6
            }
        tens = int(str(num)[0])*10
        ones = int(str(num)[1])
        return lTens[tens] + nTw(ones)

    if(num > 99 and num < 1000):
        hundreds = int(str(num)[0])
        tAo = (int(str(num)[1])*10) + (int(str(num)[2]))
        if(tAo != 0):
            extra = 3
        else:
            extra = 0
        return nTw(hundreds) + nTw(tAo) + 7 + extra
    if(num == 1000):
        return 11
            
            
            
        
count = 0
for i in range(1,1001):
    count += nTw(i)
    

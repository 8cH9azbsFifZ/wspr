DFreq=0.0
Freq=0.0
PingTime=0.0
PingFile="current"
report="26"
rms=1.0
mode_change=0
showspecjt=0
g2font='courier 16 bold'

#------------------------------------------------------ ftnstr
def ftnstr(x):
    y=""
    xs=x.tostring()
    for i in range(len(xs)):
        y=y+xs[i]
    return y

#------------------------------------------------------ filetime
def filetime(t):
#    i=t.rfind(".")
    i=rfnd(t,".")
    t=t[:i][-6:]
    t=t[0:2]+":"+t[2:4]+":"+t[4:6]
    return t

#------------------------------------------------------ rfnd
#Temporary workaround to replace t.rfind(c)
def rfnd(t,c):
    for i in range(len(t)-1,0,-1):
        if t[i:i+1]==c: return i
    return -1

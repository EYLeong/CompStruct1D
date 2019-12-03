import serial
from subprocess import Popen
import os

dirname = os.path.dirname(__file__)
plus = os.path.join(dirname, 'sfx_sounds_interaction1.wav')
minus = os.path.join(dirname, 'sfx_sounds_damage1.wav')
win = os.path.join(dirname, 'sfx_sounds_fanfare1.wav')

ser = serial.Serial('/dev/ttyACM0')
while(ser.isOpen):
    received = ser.read()
    print(received)
    if(received == b'a' or received == b'b'):
        Popen(["aplay", plus])
    if(received == b'c' or received == b'd'):
        Popen(["aplay", minus])
    if(received == b'e' or received == b'f'):
        Popen(["aplay", win])

import itertools
import enchant

d = enchant.Dict("en_US")
i=0
a=[]


x = [['H','R','M','L'],
['M','U','L','K'],
['W','A','T','E'],
['D','I','A','D'],
['L','L','O','S'],
['F','F','S','N'],
['B','Y','K','M'],
['S','H','E','P'],
['P','N','N','Y']]

for c in zip(*x):
    a.append(list(c))

for v in itertools.product(*a):
    if d.check("".join(v)):
        i+=1
        print("".join(v))

print(i)

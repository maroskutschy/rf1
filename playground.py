print("test")

def addition (a, b):
    return a+b

c = addition(5,1)

if (c>7):
    print( str(c) + " is greater than 7")
elif (c < 7):
    print(str(c) + " is lower than 7")
else:
    print(str(c) + " is equal 7")

list1 = [1,3,5,7,9]
print (list1.__getitem__(0))
list1.append(11)

print(list1)
for i in list1:
    print(i)

for x in list1:
    print(x)
    if (x == 5):
        break

for x in range(6):
    print ("???" + str(x))

for y in range(3):
  print("---" + str(y))
  print("hello")







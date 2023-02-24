import random
operators = ['*', '+', '-', '/']
x = [chr(random.randint(65,90))+ operators[random.randint(0, len(operators)-1)] + chr(random.randint(65,90)) for i in range(len(operators) + 1)]
expr = ''
  
for e in x:
   expr += e

print(expr)
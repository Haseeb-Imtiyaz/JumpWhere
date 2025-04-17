n = 3
k = 3
from math import factorial
numbers = list(range(1, n+1))
k -= 1
result = ""

for i in range(n, 0, -1):
    f = factorial(i-1)
    index = k // f
    result += str(numbers.pop(index))
    k %= f

print(result)

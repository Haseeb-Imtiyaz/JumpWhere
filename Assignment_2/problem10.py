heights = [2,1,5,6,2,3]
heights = [-1] + heights + [-1]
max_area = 0
stack = [(0, -1)]

for i in range(1, len(heights)):
    start = i
    while stack[-1][1] > heights[i]:
        index, h = stack.pop()
        max_area = max(max_area, h * (i - index))
        start = index
    stack.append((start, heights[i]))

print(max_area)

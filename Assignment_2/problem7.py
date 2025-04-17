n = 4
prerequisites = [[1, 0], [2, 1], [3, 2]]

graph = [[] for _ in range(n)]
indegree = [0] * n

for a, b in prerequisites:
    graph[b].append(a)
    indegree[a] += 1

queue = []
for i in range(n):
    if indegree[i] == 0:
        queue.append(i)

count = 0
while queue:
    node = queue[0]
    queue = queue[1:]
    count += 1
    for nei in graph[node]:
        indegree[nei] -= 1
        if indegree[nei] == 0:
            queue.append(nei)

print(count == n)

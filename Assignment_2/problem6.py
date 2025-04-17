gas = [1,2,3,4,5]
cost = [3,4,5,1,2]

remaining = 0
prev_remaining = 0
candidate = 0

for i in range(len(gas)):
    remaining += gas[i] - cost[i]
    if remaining < 0:
        candidate = i + 1
        prev_remaining += remaining
        remaining = 0

if remaining + prev_remaining >= 0:
    print(candidate)
else:
    print(-1)
from collections import Counter

s = "ADOBECODEBANC"
t = "ABC"

freqt = Counter(t)
freqs = Counter()
left = 0
start = 0
end = len(s)
satisfied = 0

for right in range(len(s)):
    freqs[s[right]] += 1
    if s[right] in freqt and freqs[s[right]] == freqt[s[right]]:
        satisfied += 1
    while satisfied == len(freqt):
        if right - left < end - start:
            start, end = left, right
        if s[left] in freqt and freqs[s[left]] == freqt[s[left]]:
            satisfied -= 1
        freqs[s[left]] -= 1
        left += 1

print(s[start:end+1] if end - start < len(s) else "")

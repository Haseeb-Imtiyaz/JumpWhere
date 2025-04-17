arr = [2, 4, 5, 5, 5, 5, 5, 7, 9, 9]
sort_arr = sorted(arr)
start = sort_arr.index(5) 
end = start + sort_arr.count(5) - 1 
print(start, end) 

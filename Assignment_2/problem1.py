def check_anagram(x, y):
    if len(x) != len(y): 
        print("Not anagram")
        return
    for i in x:
        if x.count(i) != y.count(i):
            print("Not anagram")
            return
    
    print("Anagram") 
check_anagram("hello", "world") 
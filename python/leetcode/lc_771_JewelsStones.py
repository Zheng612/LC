# You're given strings jewels representing the types of stones that are jewels, 
# and stones representing the stones you have. Each character in stones is a type of stone you have. 
# You want to know how many of the stones you have are also jewels.
# Letters are case sensitive, so "a" is considered a different type of stone from "A".

class Solution(object):
    def numJewelsInStones(self, jewels, stones):
        i=0
        j=0
        a=0
        for i in range(0, len(jewels)):
            for j in range(0, len(stones)):
                if stones[j]==jewels[i]:
                    a+=1
        return(a)

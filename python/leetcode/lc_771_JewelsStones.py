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
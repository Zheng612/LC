class Solution(object):
    def kidsWithCandies(self, candies, extraCandies):
        a=max(candies)-extraCandies
        b=[]
        for i in candies:
            if i<a:
                b.append(False)
            else:
                b.append(True)
        return (b)
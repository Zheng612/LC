class Solution(object):
    def maximumWealth(self, accounts):
        a = []
        for i in accounts:
            a.append(sum(i))
        return (max(a))

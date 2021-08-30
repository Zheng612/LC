class Solution(object):
    def runningSum(self, nums):
        my_index=0
        running_sum=[]
        for i in nums:
            my_index+=i
            running_sum.append(my_index)
        return(running_sum)


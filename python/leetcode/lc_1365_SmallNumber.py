class Solution(object):
    def smallerNumbersThanCurrent(self, nums):
        b=sorted(nums)
        my_list=[]
        for x in nums:
            a=b.index(x)
            my_list.append(a)
        return(my_list)
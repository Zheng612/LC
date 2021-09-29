# Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. 
# That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].
# Return the answer in an array.

class Solution(object):
    def smallerNumbersThanCurrent(self, nums):
        b=sorted(nums)
        my_list=[]
        for x in nums:
            a=b.index(x)
            my_list.append(a)
        return(my_list)

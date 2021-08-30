class Solution(object):
    def numIdenticalPairs(self, nums):
        i=0
        j=0
        my_list=[]
        for i in range(i, len(nums)):
            for j in range(i+1,len(nums)):
                if nums[i] == nums [j]:
                    my_list.append(j)
        return len(my_list)
# Given two arrays of integers nums and index. Your task is to create target array under the following rules:\
#     Initially target array is empty.
#     From left to right read nums[i] and index[i], insert at index index[i] the value nums[i] in target array.
#     Repeat the previous step until there are no elements to read in nums and index.
# Return the target array.
# It is guaranteed that the insertion operations will be valid.

class Solution(object):
    def createTargetArray(self, nums, index):
        i=0
        mylist=[]

        for i in range(0, len(nums)):
            j=index[i]
            if i==j:
                mylist.insert(i, nums[i])
            else:
                mylist.insert(j, nums[i])
        return mylist

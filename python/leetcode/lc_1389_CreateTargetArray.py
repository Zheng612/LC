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
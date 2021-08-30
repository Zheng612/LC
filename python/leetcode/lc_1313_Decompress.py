class Solution(object):
    def decompressRLElist(self, nums):
        i=0
        my_list=[]
        hello=[]
        while i <len(nums):
            #my_list.append(nums[i]*str(nums[i+1]))
            a=0
            while a<nums[i]:
                my_list.append(nums[i+1])
                a+=1
            i=i+2
        return my_list
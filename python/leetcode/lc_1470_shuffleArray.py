class Solution(object):
    def shuffle(self, nums, n):
        nums1=nums[0:n]
        nums2=nums[n:len(nums)]
        new_list=[]
        for i in range(0,n):
            new_list.append(nums1[i])
            new_list.append(nums2[i])
        return(new_list)
# We are given a list nums of integers representing a list compressed with run-length encoding.
# Consider each adjacent pair of elements [freq, val] = [nums[2*i], nums[2*i+1]] (with i >= 0). 
# For each such pair, there are freq elements with value val concatenated in a sublist. Concatenate all the sublists from left to right to generate the decompressed list.
# Return the decompressed list.


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

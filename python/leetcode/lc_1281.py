# Given an integer number n, return the difference between the product of its digits and the sum of its digits.

# Example: 
# Input: n = 234
# Output: 15 
# Explanation: 
# Product of digits = 2 * 3 * 4 = 24 
# Sum of digits = 2 + 3 + 4 = 9 
# Result = 24 - 9 = 15

class Solution(object):
    def subtractProductAndSum(self, n):
        product=1
        my_sum=0
        mylist=[]
        for i in str(n):
            product=product*int(i)
            my_sum=my_sum+int(i)
        return product-my_sum

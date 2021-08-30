class Solution(object):
    def subtractProductAndSum(self, n):
        product=1
        my_sum=0
        mylist=[]
        for i in str(n):
            product=product*int(i)
            my_sum=my_sum+int(i)
        return product-my_sum
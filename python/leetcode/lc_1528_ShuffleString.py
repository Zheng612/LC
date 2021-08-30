class Solution(object):
    def restoreString(self, s, indices):
        new_string=''
        for i in range(0, len(indices)):
            n=indices.index(i)
            new_string=new_string+s[n]
        return new_string
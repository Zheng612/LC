# Given a string s and an integer array indices of the same length.
# The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.
# Return the shuffled string.

class Solution(object):
    def restoreString(self, s, indices):
        new_string=''
        for i in range(0, len(indices)):
            n=indices.index(i)
            new_string=new_string+s[n]
        return new_string

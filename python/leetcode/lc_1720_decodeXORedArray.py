class Solution(object):
    def decode(self, encoded, first):
        my_list=[first]
        i=0
        for i in range(0, len(encoded)):
            my_list.append(encoded[i]^my_list[i])
        return my_list
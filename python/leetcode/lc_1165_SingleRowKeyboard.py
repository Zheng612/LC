class Solution(object):
    def calculateTime(self, keyboard, word):
        i = 0
        a = 0
        my_list = []
        final = []

        for i in word:
            my_list.append(keyboard.index(i))

        for a in range(0, len(my_list) - 1):
            final.append(abs(my_list[a] - my_list[a + 1]))
        return sum(final) + my_list[0]
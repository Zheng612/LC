# There is a special keyboard with all keys in a single row.

# Given a string keyboard of length 26 indicating the layout of the keyboard (indexed from 0 to 25). 
# Initially, your finger is at index 0. To type a character, you have to move your finger to the index of the desired character. The time taken to move your finger from index i to index j is |i - j|.

# You want to type a string word. Write a function to calculate how much time it takes to type it with one finger.

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

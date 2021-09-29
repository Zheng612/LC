# Given a string s, remove the vowels 'a', 'e', 'i', 'o', and 'u' from it, and return the new string.


class Solution(object):
    def removeVowels(self, s):
        return "".join([i for i in s if i not in ['a','e','i','o','u']])

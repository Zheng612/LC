class Solution(object):
    def interpret(self, command):
        a=command.replace("()", "o").replace("(al)","al")
        return a
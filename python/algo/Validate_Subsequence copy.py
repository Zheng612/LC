def isValidSubsequence(array, sequence):
    i = 0
    z = 0

#no matter what situation happens, the index of array will always increase.
    for i in range(0, len(array)):
        if sequence[z] == array[i]:
            z += 1
            if z == len(sequence):
                return True

        return False


array=   [5, 1, 22, 25, 6, -1, 8, 10]
sequence=[1,6,-1,10]
print(isValidSubsequence(array, sequence))

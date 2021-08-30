def NumSum(array, targetSum):

    #for all the number in an array, first number: index
    sum=[]

    if array==[]:
        return []
    for i in range(0, len(array)):
        #the second number: index plus 1
        for z in range(i+1,len(array)):
            sum.append(array[i]+array[z])
            if targetSum in sum:
                return [array[i], array[z]]

    # if it finish running the for loops and doesn't find anything, then return a []
    return []

array=[2,1,4,22,0]
targetSum=26
a=NumSum(array, targetSum)
print(a)


# https://www.algoexpert.io/questions/Two%20Number%20Sum


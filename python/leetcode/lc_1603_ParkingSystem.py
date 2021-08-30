class ParkingSystem(object):

    def __init__(self, big, medium, small):
        self.space = [big, medium, small]

    def addCar(self, carType):
        my_index = carType - 1
        if self.space[my_index] <= 0:
            return (False)
        else:
            self.space[my_index] -= 1
            return (True)

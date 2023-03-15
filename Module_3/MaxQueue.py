from SLLQueue import SLLQueue
from DLLDeque import DLLDeque

class MaxQueue(SLLQueue):
    def __init__(self):
        SLLQueue.__init__(self)
        self.max_deque = DLLDeque()

    def add(self, x : object):
        
        pass
        SLLQueue.add(self, x)
        if self.max_deque.size() == 0:
            self.max_deque.add(0, x)
        else:
            n = self.max_deque.size()
            max_ele = self.max_deque.get(0)
            #print("deque size:", n)
            if x > max_ele:
                #print(x, "is larger than current max:", max_ele, "\nAdding", x, "to position 0 in dequeue")
                self.max_deque = DLLDeque()
                self.max_deque.add_first(x)
                #print(self.max_deque)
            else:

                tail = self.max_deque.get(n-1)
                #print(x,"is smaller than current max:", max_ele, "\nStarting comparison: x =", x, " vs.", tail)
                while x > tail:
                    #print("Compared x =", x, "against tail =", tail)
                    r = self.max_deque.remove_last()
                    #print("Removed from dequeue:", r)
                    #print("deque contents:", self.max_deque)


                    n -= 1
                    #print("deque size:", n)

                    if n == 0:
                        break
                    tail = self.max_deque.get(n - 1)


              #      print("i =", i)
                self.max_deque.add_last(x)
          #  print("max_deque contents:",self.max_deque)

    def remove(self) -> object:
        r = SLLQueue.remove(self)
        if self.max_deque.size() > 0:
            if r == self.max_deque.get(0):
                self.max_deque.remove(0)
        return r

    def max(self):
        return self.max_deque.get(0)

"""

mq = MaxQueue()
mq.add(3)
print("Added:", 3)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(4)
print("Added:", 4)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(1)
print("Added:", 1)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(2)
print("Added:", 2)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

r = mq.remove()
print("Removed element:", r)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

r = mq.remove()
print("Removed element:", r)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

r = mq.remove()
print("Removed element:", r)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(8)
print("Added:", 8)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(3)
print("Added:", 3)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(5)
print("Added:", 5)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(4)
print("Added:", 4)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(1)
print("Added:", 1)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")

mq.add(6)
print("Added:", 6)
print("MaxQueue contents:", mq)
print("Max Dequeu contents", mq.max_deque)
print("Max element", mq.max(), "\n\n")


while mq.size() > 0:
    r = mq.remove()
    print("Removed element:", r)
    print("MaxQueue contents:", mq)
    print("Max Dequeu contents", mq.max_deque)
    if mq.size() > 0:
        print("Max element", mq.max(), "\n\n")
        
"""
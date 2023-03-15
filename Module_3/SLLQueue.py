from Interfaces import Queue
import numpy as np


class SLLQueue(Queue):
    class Node:
        def __init__(self, x: object):
            self.next = None
            self.x = x

    def __init__(self):
        self.head = None
        self.tail = None
        self.n = 0

    def add(self, x: object):
        u = SLLQueue.Node(x)
        if self.size() == 0:
            self.head = u
        else:
            self.tail.next = u
        self.tail = u
        self.n += 1

    def remove(self) -> object:
        if self.size() == 0:  raise IndexError()
        x = self.head.x
        self.head = self.head.next
        self.n -= 1
        if self.size() == 0:
            self.head = None
            self.tail = None

        return x

    def reverse(self):
        if self.n > 1:
            dummy = self.head
            parent = dummy.next
            grandparent = parent.next
            dummy.next = None

            while parent != None:
                parent.next = dummy
                dummy = parent
                parent = grandparent
                if parent != None:
                    grandparent = parent.next
            self.tail = self.head
            self.head = dummy

    def size(self) -> int:
        return self.n

    def __str__(self):
        s = "["
        u = self.head
        while u is not None:
            s += "%r" % u.x
            u = u.next
            if u is not None:
                s += ","
        return s + "]"

    def __iter__(self):
        self.iterator = self.head
        return self

    def __next__(self):
        if self.iterator != None:
            x = self.iterator.x
            self.iterator = self.iterator.next
        else:
            raise StopIteration()
        return x


# q = SLLQueue()
# for i in range(10):
#     q.add(i)
#
# print(q)
# q.reverse()
# print(q)
#
# while q.size() > 0:
#     print(q.remove(), end=" ")
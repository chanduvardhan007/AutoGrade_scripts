from Interfaces import Stack
import numpy as np


class SLLStack(Stack):
    class Node:
        def __init__(self, x: object):
            self.next = None
            self.x = x

    def __init__(self):
        self.head = None
        self.tail = None
        self.n = 0

    def push(self, x: object):
        u = SLLStack.Node(x)
        u.next = self.head
        self.head = u
        if self.size() == 0:
            self.tail = u
        self.n += 1

    def pop(self) -> object:
        if self.size() == 0: raise IndexError()
        x = self.head.x
        self.head = self.head.next
        self.n -= 1
        if self.size() == 0:
            self.head = None
        return x

    def size(self) -> int:
        return self.n

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





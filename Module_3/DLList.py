from Interfaces import List
import numpy as np

import importlib
import my_module



importlib.reload(my_module)
class DLList(List):
    class Node:
        def __init__(self, x):
            self.next = None
            self.prev = None
            self.x = x

    def __init__(self):
        self.dummy = DLList.Node("")
        self.dummy.next = self.dummy
        self.dummy.prev = self.dummy
        self.n = 0

    def get_node(self, i: int) -> Node:
        if i < 0 or i > self.n:  raise IndexError()
        if i < self.size() / 2:
            p = self.dummy.next
            for j in range(i):
                p = p.next
        else:
            p = self.dummy
            for j in range(self.size() - i):
                p = p.prev
        return p

    def get(self, i):
        if i < 0 or i >= self.n:  raise IndexError()
        return self.get_node(i).x

    def set(self, i: int, x):
        if i < 0 or i >= self.n:  raise IndexError()
        u = self.get_node(i)
        y = u.x
        u.x = x
        return y

    def add_before(self, w: Node, x):
        u = DLList.Node(x)
        u.prev = w.prev
        u.next = w
        u.next.prev = u
        u.prev.next = u
        self.n += 1

        if self.n == 1:
            self.dummy.next = u
            self.dummy.prev = u
        return u

    def add(self, i: int, x):
        if i < 0 or i > self.n:  raise IndexError()
        self.add_before(self.get_node(i), x)

    def _remove(self, w: Node):
        w.prev.next = w.next
        w.next.prev = w.prev
        self.n -= 1
        if self.n == 0:
            self.dummy.prev = self.dummy
            self.dummy.next = self.dummy
        return w.x

    def remove(self, i: int):
        if i < 0 or i >= self.n:  raise IndexError()
        return self._remove(self.get_node(i))

    def size(self):
        return self.n

    def reverse(self):
        head = self.dummy.next
        tail = self.dummy.prev

        previous = self.dummy
        current = self.dummy.next
        curr_nxt = current.next

        while current is not self.dummy:
            current.next = previous
            current.prev = curr_nxt

            previous = current
            current = curr_nxt
            curr_nxt = curr_nxt.next

        self.dummy.next = tail
        self.dummy.prev = head



    def append(self, x):
        self.add(self.n, x)

    def isPalindrome(self):
        n, p = self.dummy.next, self.dummy.prev
        while n.x == p.x and n != self.dummy:
            n, p = n.next, p.prev
        return n == self.dummy

    def swap(self, i, j):
        if i < 0 or i >= self.n or j < 0 or j >= self.n:
            raise IndexError
        node_i = self.get_node(i)
        node_j = self.get_node(j)
        i_next = node_i.next
        i_prev = node_i.prev
        j_next = node_j.next
        j_prev = node_j.prev

        i_prev.next = node_j
        node_j.prev = i_prev
        node_j.next = i_next
        i_next.prev = node_j

        j_prev.next = node_i
        node_i.prev = j_prev
        node_i.next = j_next
        j_next.prev = node_i





    def __str__(self):
        s = "["
        u = self.dummy.next

        i = 0
        while u is not self.dummy:
            s += "%r" % u.x
            u = u.next
            i += 1
            if i < self.n:
                s += ","
        return s + "]"

    def __iter__(self):
        self.iterator = self.dummy.next
        return self

    def __next__(self):
        if self.iterator != self.dummy:
            x = self.iterator.x
            self.iterator = self.iterator.next
        else:
            raise StopIteration()
        return x





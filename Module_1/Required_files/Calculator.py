import numpy as np
import ArrayStack
# import BinaryTree
# import ChainedHashTable
# import DLList
import operator


class Calculator:
    def __init__(self):
        self.dict = None#ChainedHashTable.ChainedHashTable(DLList.DLList)

    def set_variable(self, k: str, v: float):
        self.dict.add(k, v)

    def matched_expression(self, s : str) -> bool:
        parens = ArrayStack.ArrayStack()
        for c in s:
            if c == "(":
                parens.push(c)
            if c == ")":
                if parens.size() > 0:
                    parens.pop()
                else:
                    return False
        return parens.size() == 0

    def build_parse_tree(self, exp: str) -> str:
        # todo
        pass

    def _evaluate(self, root):
        op = {'+': operator.add, '-': operator.sub, '*': operator.mul, '/': operator.truediv}
        # todo
        pass

    def evaluate(self, exp):
        parseTree = self.build_parse_tree(exp)
        return self._evaluate(parseTree.r)

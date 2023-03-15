import ArrayStack
import ChainedHashTable
import DLList
import operator
import re

class Calculator:
    def __init__(self) :
        self.dict = ChainedHashTable.ChainedHashTable(DLList.DLList)

    def set_variable(self, k :str, v : float):
        self.dict.add(k,v)
        
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

    def build_parse_tree(self, exp : str) -> str:
        # todo
        pass 

    def _evaluate(self, root):
        op = { '+':operator.add, '-':operator.sub, '*':operator.mul, '/':operator.truediv}
        # todo
        pass 

    def evaluate(self, exp):
        parseTree = self.build_parse_tree(exp)
        return self._evaluate(parseTree.r)

    def print_expression(self, expr:str):
        variables = [x for x in re.split('\W+', expr) if x.isalnum()]
        e = re.split('\w+', expr)
        for i in range(len(variables)):
            var = variables[i]
            val = self.dict.find(var)
            if val is not None:
                variables[i] = str(val)
        exp2 = ""
        while len(variables) > 0 and len(e) > 0:
            exp2 += e[0] + variables[0]
            del variables[0]
            del e[0]

        while len(e) > 0:
            exp2 += e[0]
            del e[0]
        print(exp2)





# calc = Calculator()
# exp = "(a+b)+d*(alpha1+beta)+f//d2+a"
# calc.set_variable('a', 1)
# calc.set_variable('beta', 23.5)
# calc.set_variable('d', -5)
# calc.set_variable('alpha1', 44)
# calc.set_variable('d2', -100)
# print("Original expression:", exp)
# print("Values replaced:", end=' ')
# calc.print_expression(exp)


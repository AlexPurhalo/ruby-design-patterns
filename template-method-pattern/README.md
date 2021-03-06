### The Template Method Pattern
The Template Method pattern is simply a fancy way of saying that if you want to vary an algorithm, one way to do so is to code the invariant part in a base class and to encapsulate the variable parts in methods that are defined by a number of subclasses.
The base class can simply leave the methods completely undefined—in that case, the subclasses must supply the methods.
Alternatively, the base class can provide a default implementation for the methods that the subclasses can override if they want.

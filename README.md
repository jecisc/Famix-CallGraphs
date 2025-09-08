# Famix-CallGraphs

## Installation 

TODO

## Documentation

TODO

### Edge cases

#### Java static initialization blocks

In Java classes can have a static initialization block. If that is the case, this block will be called before the first instantiation of a class. 
In the callgraph we build, we are following this logic, but if the callgraph is not build by providing the real entry point of your execution, then this initialization block will be in the wrong place.
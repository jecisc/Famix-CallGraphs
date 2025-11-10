# Famix-CallGraphs

The goal of this project is to provide call graph builders for Famix models.

For now we only support the CHA call graph algorithm for Java language, but this is planed to evolve.

## Installation 

To install the project in your Pharo image execute:

```Smalltalk
    Metacello new
    	githubUser: 'jecisc' project: 'Famix-CallGraphs' commitish: 'main' path: 'src';
    	baseline: 'FamixCallGraphs';
    	load
```

To add it to your baseline:

```Smalltalk
    spec
    	baseline: 'FamixCallGraphs'
    	with: [ spec repository: 'github://jecisc/Famix-CallGraphs:main/src' ]
```

## Documentation

### CHA 

In order to use the CHA (Class Hierarchy Analysis) call graph builder you should use the class `FamixJavaCHABuilder`. You can provide it with `FamixJavaMethod` instances using `entryPoint:` or `entryPoints:`.

Examples:

```smalltalk
    (FamixJavaCHABuilder entryPoints: (model allMethods select: [ :method | method name = 'main' ])) build
```


```smalltalk
    (FamixJavaCHABuilder entryPoint: (tagcollections31 entityNamed: #'org.apache.commons.collections.map.HashedMap.readObject(ObjectInputStream)')) build.
```

### CallGraph result

Once a CallGraph algorithm was applied, one will get an instance of `FamixCallGraph` as a result.
This class will contain a few navigation methods and the list of entry points returning instance of `FamixCallGraphNode`.

A `FamixCallGraphNode` knows a few useful information:
- The `methodSignature` corresponding to the node
- The `kind` which is a Famix entity that is holding the method
- The `realMethod`` corresponding to the node
- The `callees` which is the list of nodes called by the current node
- The `callers` which is the list of nodes calling the current node

>> Note: The `kind` is not necessarily the entity defining the method in the Java code depending on the call graph algorithm. The method can be defined in an interface or a superclass but the kind is here to provide context for the callgraph building.

On top of this, the call graph and call graph nodes are providing some methods to explore the call graph.

>> Note: This is still a work in progress. I currently implemented only what is needed by the tests of the project. In the future I want to add an integration with pharo-ai graph algorithms.

### Famix-CallGraphs and FamixBridge

It is possible to use Famix-CallGraphs with different models been aggregated by [FamixBridge](https://github.com/moosetechnology/Famix-Bridge). Here is an example:

```smalltalk
workspace := MooseWorkspace new.
workspace mainModel: yso;
    addLibraryModel: cc31.

workspace interModelModeDuring: [ (FamixJavaCHABuilder entryPoint: (yso entityNamed: 'ysoserial.payloads.CommonsCollections1.getObject(String)')) build ]
```

### Testing of the project

A blog post is [available here](https://modularmoose.org/blog/2025-10-08-testing-your-algo-on-a-java-project/) in order to explain how the tests of the project are working.

### Edge cases

#### Java static initialization blocks

In Java classes can have a static initialization block. If that is the case, this block will be called before the first instantiation of a class. 
In the callgraph we build, we are following this logic, but if the callgraph is not build by providing the real entry point of your execution, then this initialization block will be in the wrong place.
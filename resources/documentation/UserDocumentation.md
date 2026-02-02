# Famix CallGraphs

<!-- TOC -->

- [Famix CallGraphs](#famix-callgraphs)
  - [Class Hierarchy Analysis (CHA)](#class-hierarchy-analysis-cha)
  - [CallGraph result](#callgraph-result)
  - [Management of stubs](#management-of-stubs)
  - [Famix-CallGraphs and FamixBridge](#famix-callgraphs-and-famixbridge)
  - [Additional properties](#additional-properties)
  - [Path Finder](#path-finder)
  - [Testing of the project](#testing-of-the-project)
  - [Edge cases](#edge-cases)
    - [Java static initialization blocks](#java-static-initialization-blocks)

<!-- /TOC -->

## Class Hierarchy Analysis (CHA)

In order to use the CHA (Class Hierarchy Analysis) call graph builder you should use the class `FamixJavaCHABuilder`. You can provide it with `FamixJavaMethod` instances using `entryPoint:` or `entryPoints:`.

Examples:

```smalltalk
(FamixJavaCHABuilder entryPoints: (model allMethods select: [ :method | method name = 'main' ])) build
```


```smalltalk
(FamixJavaCHABuilder entryPoint: (tagcollections31 entityNamed: #'org.apache.commons.collections.map.HashedMap.readObject(ObjectInputStream)')) build.
```

## CallGraph result

Once a CallGraph algorithm was applied, one will get an instance of `FamixCallGraph` as a result.
This class will contain a few navigation methods and the list of entry points returning instance of `FamixCallGraphNode`.

A `FamixCallGraphNode` knows a few useful information:
- The `methodSignature` corresponding to the node
- The `kind` which is a Famix entity that is holding the method
- The `realMethod` corresponding to the node
- The `callees` which is the list of nodes called by the current node
- The `callers` which is the list of nodes calling the current node

> Note: The `kind` is not necessarily the entity defining the method in the Java code depending on the call graph algorithm. The method can be defined in an interface or a superclass but the kind is here to provide context for the callgraph building.

On top of this, the call graph and call graph nodes are providing some methods to explore the call graph.

> Note: This is still a work in progress. I currently implemented only what is needed by the tests of the project. In the future I want to add an integration with pharo-ai graph algorithms.

## Management of stubs

Most of the time we do not have the model of the full code executed because we miss the code of some dependencies and of the JDK. 

In that case the CallGraph algos have two ways of handling stubs.

The first case is when we call a method that we do not have from a concrete type. In that case, `VerveineJ` is able to create a stub method and we produce a `FamixCallGraphNode` pointing this stub method. You can know if this is the case by calling `isStub` on your node.

The second case is when we call a method that we do not have and that is declared by an interface. Since we do not know any concrete implementors of the method, we will create a `FamixCallGraphStubNode` instead of a `FamixCallGraphNode`. This node will have no callees since we cannot build its edges. This kind of node will return true to `isStubNode` and `isStub`.

To resume we have 3 possible cases:
- We do not have a stub: the produced node will return false to `isStub` and `isStubNode`.
- We have a concrete stub method: the produced node will return true to `isStub` and false to `isStubNode`.
- We have a stub method from an interface: the produced node will return true to `isStub` and `isStubNode`.

## Famix-CallGraphs and FamixBridge

It is possible to use Famix-CallGraphs with different models been aggregated by [FamixBridge](https://github.com/moosetechnology/Famix-Bridge). Here is an example:

```smalltalk
workspace := MooseWorkspace new.
workspace mainModel: yso;
    addLibraryModel: cc31.

workspace interModelModeDuring: [ (FamixJavaCHABuilder entryPoint: (yso entityNamed: 'ysoserial.payloads.CommonsCollections1.getObject(String)')) build ]
```

## Additional properties

It can be useful sometimes to annotate some nodes with some informations. This is possible with additional properties. 

You can use them like this:

```smalltalk
aNode additionPropertyNamed: #foo put: #bar.
aNode additionPropertyNamed: #foo. "==> #bar"
aNode additionPropertyNamed: #foo2. "==> NotFound"
aNode additionPropertyNamed: #foo2 ifPresent: [ :value | value ]. "==> nil"
aNode additionPropertyNamed: #foo ifPresent: [ :value | value ]. "==> #bar"
aNode additionPropertyNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ #toto ]. "==> #bar"
aNode additionPropertyNamed: #foo2 ifPresent: [ :value | value ] ifAbsent: [ #toto ]. "==> #toto"
```

The implementation that is currently used is optimized to have a weak memory footprint but the counterpart is that this implementation can be slow if we annotate a lot of nodes. 
If we need to annotate a lot of nodes we might have to develop new solutions. 

> Note: We are using a singleton to add the properties of all nodes. This singleton will clean itself if a callgraph is not used anymore and garbage collected. But if those callgraph are not garbage colleted but we want to reset the properties, we can execute `FamixCallGraphAdditionalProperties resetAdditionalProperties` to reset the singleton. THIS WILL AFFECT ALL CALLGRAPHS.

## Path Finder
The Path Finder provides an API to search for paths between two nodes using a Breadth-First Search (BFS) approach.

You can it like this:

```smalltalk
aGraph findPathFrom: startNode to: targetNode.
aGraph findAllPathFrom: startNode to: targetNode.
aGraph findPathFromNodeNamed: 'com.example.Class.methodA()' toNodeNamed: 'com.example.Class.methodB()'.
aGraph findAllPathFromNodeNamed: 'com.example.Class.methodA()' toNodeNamed: 'com.example.Class.methodB()'
```



## Testing of the project

A blog post is [available here](https://modularmoose.org/blog/2025-10-08-testing-your-algo-on-a-java-project/) in order to explain how the tests of the project are working.

## Edge cases

### Java static initialization blocks

In Java classes can have a static initialization block. If that is the case, this block will be called before the first instantiation of a class. 
In the callgraph we build, we are following this logic, but if the callgraph is not build by providing the real entry point of your execution, then this initialization block will be in the wrong place.
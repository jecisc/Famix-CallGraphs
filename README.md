# Famix-CallGraphs

The goal of this project is to provide call graph builders for Famix models.

For now we only support the CHA call graph algorithm for Java language, but this is planed to evolve.

<!-- TOC -->

- [Famix-CallGraphs](#famix-callgraphs)
  - [Installation](#installation)
  - [Documentation](#documentation)
    - [Class Hierarchy Analysis (CHA)](#class-hierarchy-analysis-cha)
    - [CallGraph result](#callgraph-result)
    - [Famix-CallGraphs and FamixBridge](#famix-callgraphs-and-famixbridge)
    - [Additional properties](#additional-properties)
    - [Testing of the project](#testing-of-the-project)
    - [Edge cases](#edge-cases)
      - [Java static initialization blocks](#java-static-initialization-blocks)

<!-- /TOC -->

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

### Class Hierarchy Analysis (CHA)

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
- The `realMethod` corresponding to the node
- The `callees` which is the list of nodes called by the current node
- The `callers` which is the list of nodes calling the current node

> Note: The `kind` is not necessarily the entity defining the method in the Java code depending on the call graph algorithm. The method can be defined in an interface or a superclass but the kind is here to provide context for the callgraph building.

On top of this, the call graph and call graph nodes are providing some methods to explore the call graph.

> Note: This is still a work in progress. I currently implemented only what is needed by the tests of the project. In the future I want to add an integration with pharo-ai graph algorithms.

### Famix-CallGraphs and FamixBridge

It is possible to use Famix-CallGraphs with different models been aggregated by [FamixBridge](https://github.com/moosetechnology/Famix-Bridge). Here is an example:

```smalltalk
workspace := MooseWorkspace new.
workspace mainModel: yso;
    addLibraryModel: cc31.

workspace interModelModeDuring: [ (FamixJavaCHABuilder entryPoint: (yso entityNamed: 'ysoserial.payloads.CommonsCollections1.getObject(String)')) build ]
```

### Additional properties

It can be useful sometimes to annotate some nodes with some informations. This is possible with additional properties. 

You can use them like this:

```smalltalk
aNode additionPropertiesNamed: #foo put: #bar.
aNode additionPropertiesNamed: #foo. "==> #bar"
aNode additionPropertiesNamed: #foo2. "==> NotFound"
aNode additionPropertiesNamed: #foo2 ifPresent: [ :value | value ]. "==> nil"
aNode additionPropertiesNamed: #foo ifPresent: [ :value | value ]. "==> #bar"
aNode additionPropertiesNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ #toto ]. "==> #bar"
aNode additionPropertiesNamed: #foo2 ifPresent: [ :value | value ] ifAbsent: [ #toto ]. "==> #toto"
```

The implementation that is currently used is optimized to have a weak memory footprint but the counterpart is that this implementation can be slow if we annotate a lot of nodes. 
If we need to annotate a lot of nodes we might have to develop new solutions. 

> Note: We are using a singleton to add the properties of all nodes. This singleton will clean itself if a callgraph is not used anymore and garbage collected. But if those callgraph are not garbage colleted but we want to reset the properties, we can execute `FamixCallGraphAdditionalProperties resetAdditionalProperties` to reset the singleton. THIS WILL AFFECT ALL CALLGRAPHS.

### Testing of the project

A blog post is [available here](https://modularmoose.org/blog/2025-10-08-testing-your-algo-on-a-java-project/) in order to explain how the tests of the project are working.

### Edge cases

#### Java static initialization blocks

In Java classes can have a static initialization block. If that is the case, this block will be called before the first instantiation of a class. 
In the callgraph we build, we are following this logic, but if the callgraph is not build by providing the real entry point of your execution, then this initialization block will be in the wrong place.
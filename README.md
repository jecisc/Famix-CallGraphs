# Famix-CallGraphs

The goal of this project is to provide call graph builders for Famix models.

For now we only support the CHA call graph algorithm for Java language, but this is planed to evolve.

<!-- TOC -->

- [Famix-CallGraphs](#famix-callgraphs)
  - [Installation](#installation)
  - [Documentation](#documentation)
    - [Quick Start](#quick-start)
    - [More Documentation](#more-documentation)

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

### Quick Start

You can launch a CHA call graph building this way:

```smalltalk
(FamixJavaCHABuilder entryPoints: (model allMethods select: [ :method | method name = 'main' ])) build
```

Or, using the moose name of the entity:

```smalltalk
(FamixJavaCHABuilder entryPoint: (tagcollections31 entityNamed: #'org.apache.commons.collections.map.HashedMap.readObject(ObjectInputStream)')) build.
```

### More Documentation

You can find more documentation here: [documentation](resources/documentation/UserDocumentation.md)

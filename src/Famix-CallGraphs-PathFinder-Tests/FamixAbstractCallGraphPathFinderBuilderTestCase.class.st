Class {
	#name : 'FamixAbstractCallGraphPathFinderBuilderTestCase',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#instVars : [
		'pathFinder'
	],
	#category : 'Famix-CallGraphs-PathFinder-Tests-Tests',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Tests'
}

{ #category : 'helpers' }
FamixAbstractCallGraphPathFinderBuilderTestCase class >> isAbstract [

	^ self = FamixAbstractCallGraphPathFinderBuilderTestCase
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestCase >> setUp [

	super setUp.

	pathFinder := FamixCallGraphPathFinder newOn: self graph
]

Class {
	#name : 'FamixJavaCallGraphPathFinderExample2Test',
	#superclass : 'FamixAbstractCallGraphPathFinderBuilderTestCase',
	#category : 'Famix-CallGraphs-PathFinder-Tests-Tests',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample2Test >> testFindPathFromTo [

	| entrypoint midpoint endpoint result |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example2.A2.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example2.B2.method()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example2.B2.method(String)' ]) anyOne.

	result := pathFinder findAllPathFrom: entrypoint to: endpoint.

	"We can predict that the first one will be the shorter one because we use a Breadth-First Search algorithm"
	self assert: result size equals: 2.
	self assertCollection: result first asOrderedCollection equals: {
			entrypoint.
			endpoint } asOrderedCollection.

	self assertCollection: result second asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

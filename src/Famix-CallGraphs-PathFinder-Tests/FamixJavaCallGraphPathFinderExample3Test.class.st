Class {
	#name : 'FamixJavaCallGraphPathFinderExample3Test',
	#superclass : 'FamixAbstractCallGraphPathFinderBuilderTestCase',
	#category : 'Famix-CallGraphs-PathFinder-Tests-Tests',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample3Test >> testFindAllPathFromTo [

	| entrypoint midpoint endpoint result |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example3.B3.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example3.B3.method2()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example3.B3.method3()' ]) anyOne.



	result := pathFinder findAllPathFrom: entrypoint to: endpoint.

	"the real execution is : 
	example3.B3.main(String[])
	example3.B3.method2()
	example3.A3.method1()
	example3.B3.method2()
	example3.A3.method1()
	example3.B3.method2()
	example3.B3.method3()
	
	But here is the actual one we should obtain (because no information are present about variables):
	example3.B3.main(String[])
	example3.B3.method2()
	example3.B3.method3()
	"
	
	self assert: result size equals: 1.

	self assertCollection: result first asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample3Test >> testFindPathFromTo [

	| entrypoint midpoint endpoint result |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example3.B3.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example3.B3.method2()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example3.B3.method3()' ]) anyOne.



	result := pathFinder findPathFrom: entrypoint to: endpoint.

	"the real execution is : 
	example3.B3.main(String[])
	example3.B3.method2()
	example3.A3.method1()
	example3.B3.method2()
	example3.A3.method1()
	example3.B3.method2()
	example3.B3.method3()
	
	But here is the actual one we should obtain (because no information are present about variables):
	example3.B3.main(String[])
	example3.B3.method2()
	example3.B3.method3()
	"


	self assertCollection: result asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

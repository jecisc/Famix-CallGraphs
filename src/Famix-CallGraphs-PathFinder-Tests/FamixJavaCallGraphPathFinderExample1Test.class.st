Class {
	#name : 'FamixJavaCallGraphPathFinderExample1Test',
	#superclass : 'FamixAbstractCallGraphPathFinderBuilderTestCase',
	#category : 'Famix-CallGraphs-PathFinder-Tests-Tests',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindAllPathFromNodeNamedToNodeNamed [

	| entrypoint midpoint endpoint result |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.A1.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method(String)' ]) anyOne.

	result := pathFinder findAllPathFromNodeNamed: 'example1.A1.main(String[])' toNodeNamed: 'example1.B1.method(String)'.

	self assert: result size equals: 1.
	self assertCollection: result first asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindAllPathFromTo [

	| entrypoint midpoint endpoint result |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.A1.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method(String)' ]) anyOne.

	result := pathFinder findAllPathFrom: entrypoint to: endpoint.


	self assert: result size equals: 1.
	self assertCollection: result first asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindAllPathFromToFirstNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := self graph allNodes anyOne.
	entrypoint := FamixCallGraphNode new.

	self should: [ pathFinder findAllPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindAllPathFromToLastNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := FamixCallGraphNode new.
	entrypoint := self graph allNodes anyOne.

	self should: [ pathFinder findAllPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindPathFromNodeNamedToNodeNamed [

	| entrypoint midpoint endpoint result |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.A1.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method(String)' ]) anyOne.

	result := pathFinder findPathFromNodeNamed: 'example1.A1.main(String[])' toNodeNamed: 'example1.B1.method(String)'.

	self assertCollection: result asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindPathFromTo [

	| entrypoint midpoint endpoint result |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.A1.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method(String)' ]) anyOne.

	result := pathFinder findPathFrom: entrypoint to: endpoint.

	self assertCollection: result asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindPathFromToFirstNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := self graph allNodes anyOne.
	entrypoint := FamixCallGraphNode new.

	self should: [ pathFinder findPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testFindPathFromToLastNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := FamixCallGraphNode new.
	entrypoint := self graph allNodes anyOne.

	self should: [ pathFinder findPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testUnsafeFindAllPathFromToFirstNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := self graph allNodes anyOne.
	entrypoint := FamixCallGraphNode new.

	self shouldnt: [ pathFinder unsafeFindAllPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testUnsafeFindAllPathFromToLastNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := FamixCallGraphNode new.
	entrypoint := self graph allNodes anyOne.

	self shouldnt: [ pathFinder unsafeFindAllPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testUnsafeFindPathFromToFirstNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := self graph allNodes anyOne.
	entrypoint := FamixCallGraphNode new.

	self shouldnt: [ pathFinder unsafeFindPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testUnsafeFindPathFromToLastNodeNotInGraph [

	| entrypoint endpoint |
	endpoint := FamixCallGraphNode new.
	entrypoint := self graph allNodes anyOne.

	self shouldnt: [ pathFinder unsafeFindPathFrom: entrypoint to: endpoint ] raise: Error
]

{ #category : 'tests' }
FamixJavaCallGraphPathFinderExample1Test >> testreconstructPathTargetIsOk [

	| entrypoint midpoint endpoint dict |
	entrypoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.A1.main(String[])' ]) anyOne.
	midpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method()' ]) anyOne.
	endpoint := (self graph allNodes select: [ :node | node realMethod mooseName = 'example1.B1.method(String)' ]) anyOne.

	dict := Dictionary new
		        at: entrypoint put: nil;
		        at: midpoint put: entrypoint;
		        at: endpoint put: midpoint;
		        yourself.

	self assertCollection: (pathFinder reconstructPath: dict target: endpoint) asOrderedCollection equals: {
			entrypoint.
			midpoint.
			endpoint } asOrderedCollection
]

Class {
	#name : 'FamixJavaCHAExample5Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'open sources' }
FamixJavaCHAExample5Test >> openSources [

	<script: 'self new openSources'>
	super openSources
]

{ #category : 'tests' }
FamixJavaCHAExample5Test >> testMainCallsExecute5Times [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'Operation' and: [ node methodName = 'execute' ] ]) size equals: 5
]

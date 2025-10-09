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
FamixJavaCHAExample5Test >> testMainCallsApply4TimesByEnumValue [

	| main applyMethods |
	main := self graph entryPoint.

	applyMethods := main callees select: [ :node | node methodName = 'apply' ].

	self assert: applyMethods size equals: 16.

	applyMethods := applyMethods groupedBy: #kind.

	self assert: applyMethods keys size equals: 4.

	applyMethods valuesDo: [ :values | self assert: values size equals: 4 ]
]

{ #category : 'tests' }
FamixJavaCHAExample5Test >> testMainCallsExecute5Times [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'Operation' and: [ node methodName = 'execute' ] ]) size equals: 5
]

{ #category : 'tests' }
FamixJavaCHAExample5Test >> testMainCallsPrintFromDirections [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'Directions' and: [ node methodName = 'print' ] ]) size equals: 1
]

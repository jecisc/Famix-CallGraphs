Class {
	#name : 'FamixJavaCHAExample3Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'open sources' }
FamixJavaCHAExample3Test >> openSources [

	<script: 'self new openSources'>
	super openSources
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testMainCallsTwoMethodsWithSameNameButDifferentSignature [

	| main m1 m2 |
	main := self graph anyOne.

	m1 := main callees
		      detect: [ :node | node kindName = 'A' and: [ node methodSignature = 'm()' ] ]
		      ifNone: [ self fail ].

	m2 := main callees
		      detect: [ :node | node kindName = 'A' and: [ node methodSignature = 'm(String)' ] ]
		      ifNone: [ self fail ].

	self deny: m1 identicalTo: m2.

	self assert: (main callees select: [ :node | node methodName = 'm' ]) size equals: 2
]

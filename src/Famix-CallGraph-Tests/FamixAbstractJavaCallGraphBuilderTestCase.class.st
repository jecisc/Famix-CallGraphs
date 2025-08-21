Class {
	#name : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#superclass : 'TestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'testing' }
FamixAbstractJavaCallGraphBuilderTestCase class >> isAbstract [

	^ self = FamixAbstractJavaCallGraphBuilderTestCase
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestCase class >> resources [

	^ self environment
		  at: ((self name withoutSuffix: 'Test') , 'Resource') asSymbol
		  ifPresent: [ :class | { class } ]
		  ifAbsent: [ {  } ]
]

{ #category : 'running' }
FamixAbstractJavaCallGraphBuilderTestCase >> graph [

	^ self class resources anyOne current graph
]

{ #category : 'running' }
FamixAbstractJavaCallGraphBuilderTestCase >> model [

	^ self class resources anyOne current model
]

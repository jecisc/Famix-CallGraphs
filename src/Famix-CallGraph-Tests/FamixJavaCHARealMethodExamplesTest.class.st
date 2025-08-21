Class {
	#name : 'FamixJavaCHARealMethodExamplesTest',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testInheritedMethod [

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'b' and: [ aNode kind name = 'C' ] ].

	self assert: node realMethod name equals: 'b'.
	self assert: node realMethod signature equals: 'b()'.
	"This should be B not C"
	self assert: node realMethod parentType name equals: 'B'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testInheritedMethodAt2Levels [

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'b' and: [ aNode kind name = 'D' ] ].

	self assert: node realMethod name equals: 'b'.
	self assert: node realMethod signature equals: 'b()'.
	"This should be B not C"
	self assert: node realMethod parentType name equals: 'B'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testMethodDirectlyInKind [

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'a' and: [ aNode kind name = 'A' ] ].

	self assert: node realMethod name equals: 'a'.
	self assert: node realMethod signature equals: 'a()'.
	self assert: node realMethod parentType name equals: 'A'
]

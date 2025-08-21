Class {
	#name : 'FamixJavaCHARealMethodExamplesTest',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testInheritedMethod [
	"C inherits from B. Method is in B"

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'b' and: [ aNode kind name = 'C' ] ].

	self assert: node realMethod name equals: 'b'.
	self assert: node realMethod signature equals: 'b()'.
	"This should be B not C"
	self assert: node realMethod parentType name equals: 'B'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testInheritedMethodAt2Levels [
	"D inherits from C that inherits from B. Method is in B"
	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'b' and: [ aNode kind name = 'D' ] ].

	self assert: node realMethod name equals: 'b'.
	self assert: node realMethod signature equals: 'b()'.
	"This should be B not C"
	self assert: node realMethod parentType name equals: 'B'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testMethodDirectlyInKind [
	"A has no interface and no inheritance. Method is in A"

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'a' and: [ aNode kind name = 'A' ] ].

	self assert: node realMethod name equals: 'a'.
	self assert: node realMethod signature equals: 'a()'.
	"In this simple case we have the method directly on A."
	self assert: node realMethod parentType name equals: 'A'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testMethodFromExtendedInterface [
	"F implements IB. IB extends IA. Method is on IA."

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'i' and: [ aNode kind name = 'F' ] ].

	self assert: node realMethod name equals: 'i'.
	self assert: node realMethod signature equals: 'i()'.
	self assert: node realMethod parentType name equals: 'IA'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testMethodFromInterface [
	"E implements I. Method is on I."

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'i' and: [ aNode kind name = 'E' ] ].

	self assert: node realMethod name equals: 'i'.
	self assert: node realMethod signature equals: 'i()'.
	self assert: node realMethod parentType name equals: 'I'
]

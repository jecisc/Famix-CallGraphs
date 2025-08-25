Class {
	#name : 'FamixJavaCHARealMethodExamplesTest',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'helpers' }
FamixJavaCHARealMethodExamplesTest class >> browseSources [

	<script>
	super browseSources
]

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

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testMethodFromInterfaceRedefined [
	"O inherits from N. N implements IN. N and IN define o."

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'o' and: [ aNode kind name = 'O' ] ].

	self assert: node realMethod name equals: 'o'.
	self assert: node realMethod signature equals: 'o()'.
	"N redefine the method of IN"
	self assert: node realMethod parentType name equals: 'N'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testMultipleInheritanceAndImplementations [
	"L inherits form K. K inherits from J. J implements IJ. IJ extends IJ2. IJ2 extends IJ3. l is implemented on IJ3."

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'l' and: [ aNode kind name = 'L' ] ].

	self assert: node realMethod name equals: 'l'.
	self assert: node realMethod signature equals: 'l()'.
	self assert: node realMethod parentType name equals: 'IJ3'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testOverridenMethod [
	"H inherits from G. Method is in both G and H"

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'g' and: [ aNode kind name = 'H' ] ].

	self assert: node realMethod name equals: 'g'.
	self assert: node realMethod signature equals: 'g()'.
	"Should be in H not G even if we have the method in G."
	self assert: node realMethod parentType name equals: 'H'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testPrecedenceBetweenInterfaceAndSuperclass [
	"Q inherits from P and implements IQ. q is defined on P and IQ."

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'q' and: [ aNode kind name = 'Q' ] ].

	self assert: node realMethod name equals: 'q'.
	self assert: node realMethod signature equals: 'q()'.
	"Superclass takes predominance over interface."
	self assert: node realMethod parentType name equals: 'P'
]

{ #category : 'tests' }
FamixJavaCHARealMethodExamplesTest >> testStub [
	"M does not implement #toString and gets it from Object"

	| node |
	node := self graph anyOne firstNodeMatching: [ :aNode | aNode methodName = 'toString' and: [ aNode kind name = 'M' ] ].

	self assert: node realMethod name equals: 'toString'.
	self assert: node realMethod signature equals: 'toString()'.
	self assert: node realMethod parentType name equals: 'Object'.
	self assert: node realMethod isStub
]

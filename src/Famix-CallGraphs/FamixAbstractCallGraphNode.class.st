Class {
	#name : 'FamixAbstractCallGraphNode',
	#superclass : 'Object',
	#instVars : [
		'kind',
		'methodSignature',
		'realMethod',
		'callers'
	],
	#category : 'Famix-CallGraphs',
	#package : 'Famix-CallGraphs'
}

{ #category : 'instance creation' }
FamixAbstractCallGraphNode class >> methodSignature: aString kind: aFamixType [

	^ self new
		  methodSignature: aString;
		  kind: aFamixType;
		  yourself
]

{ #category : 'comparing' }
FamixAbstractCallGraphNode >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ methodSignature = anObject methodSignature and: [ kind = anObject kind ]
]

{ #category : 'adding' }
FamixAbstractCallGraphNode >> addCaller: aNode [

	callers add: aNode
]

{ #category : 'API' }
FamixAbstractCallGraphNode >> allCallees [

	^ self allCalleesCollect: #yourself
]

{ #category : 'API' }
FamixAbstractCallGraphNode >> allCalleesCollect: aBlock [

	^ self deep: #callees collect: aBlock
]

{ #category : 'API' }
FamixAbstractCallGraphNode >> allCalleesDo: aBlock [
	"Execute the block with myself and all the nodes I call transitively as argument for each iteration."

	self deep: #callees do: aBlock
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> callees [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> callers [
	^ callers
]

{ #category : 'API' }
FamixAbstractCallGraphNode >> firstCalleeMatching: aBlock [

	self withDeep: #callees do: [ :node | (aBlock value: node) ifTrue: [ ^ node ] ].
	^ nil
]

{ #category : 'testing' }
FamixAbstractCallGraphNode >> hasCallees [

	^ self callees isNotEmpty
]

{ #category : 'testing' }
FamixAbstractCallGraphNode >> hasNodeMatching: aBlock [

	^ (self firstCalleeMatching: aBlock) isNotNil
]

{ #category : 'comparing' }
FamixAbstractCallGraphNode >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ methodSignature hash bitXor: kind hash
]

{ #category : 'initialization' }
FamixAbstractCallGraphNode >> initialize [

	super initialize.
	callers := OrderedCollection new
]

{ #category : 'inspector' }
FamixAbstractCallGraphNode >> inspectGraph: aBuilder [

	<inspectorPresentationOrder: 950 title: 'Graph'>
	| canvas shapes |
	canvas := RSCanvas new.
	shapes := self withAllCalleesCollect: [ :node |
			          | box |
			          box := RSBox new
				                 size: 30;
				                 draggable;
				                 model: node;
				                 yourself.

			          node = self ifTrue: [ box color: #red ].

			          box @ (RSLabeled new text: [ :n | n realMethod printString ]) ].

	canvas addAll: shapes.

	RSLineBuilder arrowedLine
		attachPoint: RSBorderAttachPoint new;
		canvas: canvas;
		shapes: canvas nodes;
		connectToAll: #callees.

	RSTreeLayout new
		verticalGap: 50;
		horizontalGap: 150;
		applyOn: canvas nodes.
	canvas @ RSCanvasController.

	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		  canvas: canvas;
		  yourself
]

{ #category : 'inspector' }
FamixAbstractCallGraphNode >> inspectionSource: aBuilder [

	<inspectorPresentationOrder: 950 title: 'SourceText'>
	^ aBuilder newCode
		  withoutSyntaxHighlight;
		  withLineNumbers;
		  text: self realMethod sourceText;
		  beNotEditable
]

{ #category : 'testing' }
FamixAbstractCallGraphNode >> isConstructor [

	^ self realMethod isConstructor
]

{ #category : 'testing' }
FamixAbstractCallGraphNode >> isStub [
	^ self subclassResponsibility
]

{ #category : 'testing' }
FamixAbstractCallGraphNode >> isStubNode [

	^ false
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> kind [

	^ kind
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> kind: anObject [

	kind := anObject
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> kindName [

	^ self kind name
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> methodName [

	^ self realMethod name
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> methodSignature [

	^ methodSignature
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> methodSignature: anObject [
	methodSignature := anObject
]

{ #category : 'printing' }
FamixAbstractCallGraphNode >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self kindName;
		nextPutAll: '>>';
		nextPutAll: self methodSignature;
		nextPutAll: ')'
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> realMethod [

	^ realMethod ifNil: [ realMethod := (kind lookupMethodWithSignature: methodSignature) ifNil: [ self error: 'This should not happen' ] ]
]

{ #category : 'accessing' }
FamixAbstractCallGraphNode >> realMethod: anObject [

	realMethod := anObject
]

{ #category : 'API' }
FamixAbstractCallGraphNode >> withAllCallees [

	^ self withAllCalleesCollect: #yourself
]

{ #category : 'API' }
FamixAbstractCallGraphNode >> withAllCalleesCollect: aBlock [

	^ self withDeep: #callees collect: aBlock
]

{ #category : 'API' }
FamixAbstractCallGraphNode >> withAllCalleesDo: aBlock [
	"Execute the block with myself and all the nodes I call transitively as argument for each iteration."

	self withDeep: #callees do: aBlock
]

Class {
	#name : 'FamixCallGraphNode',
	#superclass : 'Object',
	#instVars : [
		'methodSignature',
		'kind',
		'realMethod',
		'callers',
		'callees'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'instance creation' }
FamixCallGraphNode class >> methodSignature: aString kind: aFamixType [

	^ self new
		  methodSignature: aString;
		  kind: aFamixType;
		  yourself
]

{ #category : 'comparing' }
FamixCallGraphNode >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ methodSignature = anObject methodSignature and: [ kind = anObject kind ]
]

{ #category : 'adding' }
FamixCallGraphNode >> addCallee: aNode [

	callees add: aNode.
	aNode addCaller: self
]

{ #category : 'adding' }
FamixCallGraphNode >> addCaller: aNode [

	callers add: aNode
]

{ #category : 'accessing' }
FamixCallGraphNode >> callees [
	^ callees
]

{ #category : 'accessing' }
FamixCallGraphNode >> callers [
	^ callers
]

{ #category : 'API' }
FamixCallGraphNode >> firstNodeMatching: aBlock [

	self withDeep: #callees do: [ :node | (aBlock value: node) ifTrue: [ ^ node ] ].
	^ nil
]

{ #category : 'testing' }
FamixCallGraphNode >> hasCallees [

	^ self callees isNotEmpty
]

{ #category : 'testing' }
FamixCallGraphNode >> hasNodeMatching: aBlock [

	^ (self firstNodeMatching: aBlock) isNotNil
]

{ #category : 'comparing' }
FamixCallGraphNode >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ methodSignature hash bitXor: kind hash
]

{ #category : 'initialization' }
FamixCallGraphNode >> initialize [

	super initialize.
	callers := OrderedCollection new.
	callees := OrderedCollection new
]

{ #category : 'inspector' }
FamixCallGraphNode >> inspectGraph: aBuilder [

	<inspectorPresentationOrder: 950 title: 'Graph'>
	| canvas shapes |
	canvas := RSCanvas new.
	shapes := self withAllNodesCollect: [ :node |
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
FamixCallGraphNode >> inspectionSource: aBuilder [

	<inspectorPresentationOrder: 950 title: 'SourceText'>
	^ aBuilder newCode
		  withoutSyntaxHighlight;
		  withLineNumbers;
		  text: self realMethod sourceText;
		  beNotEditable
]

{ #category : 'API' }
FamixCallGraphNode >> isStub [

	^ self realMethod isStub
]

{ #category : 'accessing' }
FamixCallGraphNode >> kind [

	^ kind
]

{ #category : 'accessing' }
FamixCallGraphNode >> kind: anObject [

	kind := anObject
]

{ #category : 'accessing' }
FamixCallGraphNode >> kindName [

	^ self kind name
]

{ #category : 'accessing' }
FamixCallGraphNode >> methodName [

	^ self realMethod name
]

{ #category : 'accessing' }
FamixCallGraphNode >> methodSignature [

	^ methodSignature
]

{ #category : 'accessing' }
FamixCallGraphNode >> methodSignature: anObject [
	methodSignature := anObject
]

{ #category : 'accessing' }
FamixCallGraphNode >> outgoingInvocations [

	^ self realMethod outgoingInvocations
]

{ #category : 'printing' }
FamixCallGraphNode >> printOn: aStream [
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
FamixCallGraphNode >> realMethod [

	^ realMethod ifNil: [ realMethod := (kind lookupMethodWithSignature: methodSignature) ifNil: [ self error: 'This should not happen' ] ]
]

{ #category : 'accessing' }
FamixCallGraphNode >> realMethod: anObject [

	realMethod := anObject
]

{ #category : 'API' }
FamixCallGraphNode >> withAllNodesCollect: aBlock [

	^ self withDeep: #callees collect: aBlock
]

{ #category : 'API' }
FamixCallGraphNode >> withAllNodesDo: aBlock [
	"Execute the block with myself and all the nodes I call transitively as argument for each iteration."

	self withDeep: #callees do: aBlock
]

Extension { #name : 'FamixAbstractCallGraphNode' }

{ #category : '*Famix-CallGraphs-Properties' }
FamixAbstractCallGraphNode >> additionalProperties [

	^ FamixCallGraphAdditionalProperties current at: self ifAbsent: [ nil ]
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertyNamed: aString [

	^ (FamixCallGraphAdditionalProperties current at: self) at: aString
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertyNamed: aString ifAbsent: aBlock [

	^ FamixCallGraphAdditionalProperties current
		  at: self
		  ifPresent: [ :dic | dic at: aString ifAbsent: aBlock ]
		  ifAbsent: aBlock
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertyNamed: aString ifPresent: aBlock [

	^ FamixCallGraphAdditionalProperties current
		  at: self
		  ifPresent: [ :dic | dic at: aString ifPresent: aBlock ]
		  ifAbsent: [ nil ]
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertyNamed: aString ifPresent: aBlock ifAbsent: anotherBlock [

	^ FamixCallGraphAdditionalProperties current
		  at: self
		  ifPresent: [ :dic |
				  dic
					  at: aString
					  ifPresent: aBlock
					  ifAbsent: anotherBlock ]
		  ifAbsent: anotherBlock
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertyNamed: aString put: aValue [

	^ (FamixCallGraphAdditionalProperties current at: self ifAbsentPut: [ Dictionary new ]) at: aString put: aValue
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> removeAdditionalPropertyNamed: aString [

	^ (FamixCallGraphAdditionalProperties current at: self) removeKey: aString
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> removeAdditionalPropertyNamed: aString ifAbsent: aBlock [

	^ FamixCallGraphAdditionalProperties current
		  at: self
		  ifPresent: [ :dict | dict removeKey: aString ifAbsent: aBlock ]
		  ifAbsent: aBlock
]

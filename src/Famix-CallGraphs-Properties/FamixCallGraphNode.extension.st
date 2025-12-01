Extension { #name : 'FamixCallGraphNode' }

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalProperties [

	^ FamixCallGraphAdditionalProperties current at: self ifAbsent: [ nil ]
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertiesNamed: aString [

	^ (FamixCallGraphAdditionalProperties current at: self) at: aString
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertiesNamed: aString ifAbsent: aBlock [

	^ FamixCallGraphAdditionalProperties current
		  at: self
		  ifPresent: [ :dic | dic at: aString ifAbsent: aBlock ]
		  ifAbsent: aBlock
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertiesNamed: aString ifPresent: aBlock [

	^ FamixCallGraphAdditionalProperties current
		  at: self
		  ifPresent: [ :dic | dic at: aString ifPresent: aBlock ]
		  ifAbsent: [ nil ]
]

{ #category : '*Famix-CallGraphs-Properties' }
FamixCallGraphNode >> additionalPropertiesNamed: aString ifPresent: aBlock ifAbsent: anotherBlock [

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
FamixCallGraphNode >> additionalPropertiesNamed: aString put: aValue [

	^ (FamixCallGraphAdditionalProperties current at: self ifAbsentPut: [ Dictionary new ]) at: aString put: aValue
]

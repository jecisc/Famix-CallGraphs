Extension { #name : 'FamixJavaType' }

{ #category : '*Famix-CallGraphs' }
FamixJavaType >> lookupMethodWithSignature: aString [

	^ self methods
		  detect: [ :method | method signature = aString ]
		  ifNone: [ nil ]
]

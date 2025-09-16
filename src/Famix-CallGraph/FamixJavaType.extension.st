Extension { #name : 'FamixJavaType' }

{ #category : '*Famix-CallGraph' }
FamixJavaType >> lookupMethodWithSignature: aString [

	^ self methods
		  detect: [ :method | method signature = aString ]
		  ifNone: [ nil ]
]

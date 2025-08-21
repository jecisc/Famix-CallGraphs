Extension { #name : 'FamixJavaType' }

{ #category : '*Famix-CallGraph' }
FamixJavaType >> lookupMethodNamed: aString [

	^ self methods
		  detect: [ :method | method name = aString ]
		  ifNone: [ nil ]
]

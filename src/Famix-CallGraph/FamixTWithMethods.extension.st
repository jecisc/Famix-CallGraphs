Extension { #name : 'FamixTWithMethods' }

{ #category : '*Famix-CallGraph' }
FamixTWithMethods >> lookupMethodNamed: aString [

	^ self methods
		  detect: [ :method | method name = aString ]
		  ifNone: [ nil ]
]

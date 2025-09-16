Extension { #name : 'FamixTMethod' }

{ #category : '*Famix-CallGraph' }
FamixTMethod >> asCallGraphNode [

	^ FamixCallGraphNode methodSignature: self signature kind: self parentType
]

{ #category : '*Famix-CallGraph' }
FamixTMethod >> isMethodDefinition [
	"Allows one to know if we have a method definition and not a method declaration"

	^ [ self numberOfStatements > 0 ]
		  on: Error
		  do: [ "I moslty ended up here for stub constructors... This is not ideal :(" true ]
]

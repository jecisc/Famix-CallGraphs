Extension { #name : 'FamixCallGraphAdditionalProperties' }

{ #category : '*Famix-CallGraphs-Properties-Tests' }
FamixCallGraphAdditionalProperties class >> newInstanceDuring: aBlock [

	| current |
	current := self current.
	[
		Current := super new.
		aBlock value ] ensure: [ Current := current ]
]

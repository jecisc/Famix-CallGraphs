Extension { #name : 'FamixTMethod' }

{ #category : '*Famix-CallGraph' }
FamixTMethod >> asCallGraphNode [

	self flag: #todo. "Add constructor"
	^ FamixCallGraphNode new
		  methodName: self name;
		  realMethod: self;
		  kind: self parentType;
		  yourself
]

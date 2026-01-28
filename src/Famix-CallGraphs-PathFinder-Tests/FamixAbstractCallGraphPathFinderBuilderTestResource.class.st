Class {
	#name : 'FamixAbstractCallGraphPathFinderBuilderTestResource',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestResource',
	#category : 'Famix-CallGraphs-PathFinder-Tests-Resources',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Resources'
}

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource class >> javaSourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	| folder |
	folder := FamixCallGraphBridge sources
	          /
	          ('pf_' , ((self name withoutPrefix: 'FamixJavaCallGraphPathFinder') withoutSuffix: 'Resource') uncapitalized).

	folder ifAbsent: [ self error: 'Folder does not exists ' , folder pathString ].

	^ folder
]

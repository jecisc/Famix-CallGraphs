Class {
	#name : 'FamixAbstractCallGraphPathFinderBuilderTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'graph',
		'model'
	],
	#category : 'Famix-CallGraphs-PathFinder-Tests-Resources',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Resources'
}

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource class >> javaSourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	| folder |
	folder := FamixCallGraphPathFinderBridge sources / ('pf_' , (self name withoutPrefix: 'FamixJavaCallGraphPathFinder') withoutSuffix: 'Resource') uncapitalized.

	folder ifAbsent: [ self error: 'Folder does not exists ' , folder pathString ].

	^ folder
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> entryPoints [

	^ model allMethods select: [ :method | method name = 'main' ]
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> graph [
	^ graph
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> javaSourcesFolder [

	^ self class javaSourcesFolder
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> model [

	^ model
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> setUp [

	super setUp.
	model := (FamixJavaFoldersImporter importFolders: { self javaSourcesFolder }) anyOne.
	graph := (FamixJavaCHABuilder entryPoints: self entryPoints) build
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> tearDown [

	model := nil.
	graph := nil.
	super tearDown
]

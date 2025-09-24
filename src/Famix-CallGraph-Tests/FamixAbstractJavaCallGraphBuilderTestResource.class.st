Class {
	#name : 'FamixAbstractJavaCallGraphBuilderTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'model',
		'graph'
	],
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource class >> javaSourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	| folder |
	folder := FamixCallGraphBridge sources / ((self name withoutPrefix: 'FamixJavaCHA') withoutSuffix: 'Resource') uncapitalized.

	folder ifAbsent: [ self error: 'Folder does not exists ' , folder pathString ].

	^ folder
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource >> entryPoints [

	^ model allMethods select: [ :method | method name = 'main' ]
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource >> graph [
	^ graph
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource >> javaSourcesFolder [
	^ self class javaSourcesFolder
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource >> model [

	^ model
]

{ #category : 'running' }
FamixAbstractJavaCallGraphBuilderTestResource >> setUp [

	super setUp.
	model := (FamixJavaFoldersImporter importFolders: { self javaSourcesFolder }) anyOne.
	graph := (FamixJavaCHABuilder entryPoints: self entryPoints) build
]

{ #category : 'running' }
FamixAbstractJavaCallGraphBuilderTestResource >> tearDown [

	model := nil.
	graph := nil.
	super tearDown
]

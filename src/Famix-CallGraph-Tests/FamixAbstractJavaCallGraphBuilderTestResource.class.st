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
FamixAbstractJavaCallGraphBuilderTestResource >> entryPoints [

	^ model allMethods select: [ :method | method name = 'main' ]
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource >> graph [
	^ graph
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource >> javaSourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	^ FamixCallGraphBridge sources / ((self class name withoutPrefix: 'FamixJavaCHA') withoutSuffix: 'Resource') asLowercase
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestResource >> model [

	^ model
]

{ #category : 'running' }
FamixAbstractJavaCallGraphBuilderTestResource >> setUp [

	super setUp.
	model := (FamixJavaFoldersImporter importFolders: { self javaSourcesFolder }) anyOne.
	graph := (FamixJavaClassHierarchyAnalysisCallGraphBuilder entryPoints: self entryPoints) build
]

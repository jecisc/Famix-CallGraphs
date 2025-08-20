Class {
	#name : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'model',
		'graph'
	],
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'testing' }
FamixAbstractJavaCallGraphBuilderTestCase class >> isAbstract [

	^ self = FamixAbstractJavaCallGraphBuilderTestCase
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestCase >> entryPoints [

	^ model allMethods select: [ :method | method name = 'main' ]
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestCase >> javaSourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	^ self subclassResponsibility
]

{ #category : 'running' }
FamixAbstractJavaCallGraphBuilderTestCase >> setUp [

	super setUp.
	model := (FamixJavaFoldersImporter importFolders: { self javaSourcesFolder }) anyOne.
	graph := (FamixJavaClassHierarchyAnalysisCallGraphBuilder entryPoints: self entryPoints) build
]

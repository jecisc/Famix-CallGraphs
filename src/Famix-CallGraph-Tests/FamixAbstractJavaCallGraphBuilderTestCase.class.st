Class {
	#name : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'testing' }
FamixAbstractJavaCallGraphBuilderTestCase class >> isAbstract [

	^ self = FamixAbstractJavaCallGraphBuilderTestCase
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestCase >> javaSourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	^ self subclassResponsibility
]

{ #category : 'running' }
FamixAbstractJavaCallGraphBuilderTestCase >> setUp [

	super setUp.
	model := (FamixJavaFoldersImporter importFolders: { self javaSourcesFolder }) anyOne
]

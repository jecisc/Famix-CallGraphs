Class {
	#name : 'FamixAbstractCallGraphPathFinderBuilderTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'pathFinder'
	],
	#category : 'Famix-CallGraphs-PathFinder-Tests-Tests',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Tests'
}

{ #category : 'helpers' }
FamixAbstractCallGraphPathFinderBuilderTestCase class >> browseSources [

	<script>
	self sourceResource javaSourcesFolder openInOSFileBrowser
]

{ #category : 'helpers' }
FamixAbstractCallGraphPathFinderBuilderTestCase class >> isAbstract [

	^ self = FamixAbstractCallGraphPathFinderBuilderTestCase
]

{ #category : 'helpers' }
FamixAbstractCallGraphPathFinderBuilderTestCase class >> resources [

	^ self environment
		  at: ((self name withoutSuffix: 'Test') , 'Resource') asSymbol
		  ifPresent: [ :class | { class } ]
		  ifAbsent: [ {  } ]
]

{ #category : 'helpers' }
FamixAbstractCallGraphPathFinderBuilderTestCase class >> sourceResource [

	^ self resources anyOne current
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestCase >> graph [

	^ self sourceResource graph
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestCase >> model [

	^ self sourceResource model
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestCase >> openSources [

	<script: 'self new openSources'>
	self resources anyOne javaSourcesFolder openInOSFileBrowser
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestCase >> setUp [

	super setUp.

	pathFinder := FamixCallGraphPathFinder newOn: self graph
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestCase >> sourceResource [
	"I return the instance of the test resource I'm using to build the sources of a java project"

	^ self class sourceResource
]

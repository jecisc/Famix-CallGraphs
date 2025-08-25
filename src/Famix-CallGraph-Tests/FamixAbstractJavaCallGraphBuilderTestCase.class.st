Class {
	#name : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#superclass : 'TestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'helpers' }
FamixAbstractJavaCallGraphBuilderTestCase class >> browseSources [

	<script>
	self sourceResource javaSourcesFolder openInOSFileBrowser
]

{ #category : 'testing' }
FamixAbstractJavaCallGraphBuilderTestCase class >> isAbstract [

	^ self = FamixAbstractJavaCallGraphBuilderTestCase
]

{ #category : 'accessing' }
FamixAbstractJavaCallGraphBuilderTestCase class >> resources [

	^ self environment
		  at: ((self name withoutSuffix: 'Test') , 'Resource') asSymbol
		  ifPresent: [ :class | { class } ]
		  ifAbsent: [ {  } ]
]

{ #category : 'helpers' }
FamixAbstractJavaCallGraphBuilderTestCase class >> sourceResource [

	^ self resources anyOne current
]

{ #category : 'helpers' }
FamixAbstractJavaCallGraphBuilderTestCase >> graph [

	^ self sourceResource graph
]

{ #category : 'helpers' }
FamixAbstractJavaCallGraphBuilderTestCase >> model [

	^ self sourceResource model
]

{ #category : 'helpers' }
FamixAbstractJavaCallGraphBuilderTestCase >> sourceResource [
	"I return the instance of the test resource I'm using to build the sources of a java project"

	^ self class sourceResource
]

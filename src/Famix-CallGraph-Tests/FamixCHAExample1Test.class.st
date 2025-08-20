Class {
	#name : 'FamixCHAExample1Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'accessing' }
FamixCHAExample1Test >> javaSourcesFolder [

	^ FamixCallGraphBridge sources / 'example1'
]

{ #category : 'tests' }
FamixCHAExample1Test >> testSimple [

	(FamixJavaClassHierarchyAnalysisCallGraphBuilder entryPoint: (model allMethods detect: [ :method | method name = 'main' ])) build.
	1 halt
]

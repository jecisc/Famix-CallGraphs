"
I am a baseline to define the structure and dependencies of the FamixCallGraph project.
"
Class {
	#name : 'BaselineOfFamixCallGraphs',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixCallGraphs',
	#package : 'BaselineOfFamixCallGraphs'
}

{ #category : 'baselines' }
BaselineOfFamixCallGraphs >> baseline: spec [

	<baseline>
	spec for: #common do: [
			self gitBridge: spec.

			spec
				package: 'Famix-CallGraphs';
				package: 'Famix-CallGraphs-Tests' with: [ spec requires: #( 'Famix-CallGraphs' 'GitBridge' ) ]. "Groups"
			spec
				group: 'Core' with: #( 'Famix-CallGraphs' );
				group: 'Tests' with: #( 'Famix-CallGraphs-Tests' ) ].

	spec for: #NeedsFamix do: [
			spec baseline: 'Famix' with: [ spec repository: 'github://moosetechnology/Famix:development/src' ].
			spec package: 'Famix-CallGraphs' with: [ spec requires: #( Famix ) ] ]
]

{ #category : 'accessing' }
BaselineOfFamixCallGraphs >> customProjectAttributes [

	'BaselineOfFamix' asPackageIfAbsent: [ ^ #( #NeedsFamix ) ].
	^ #(  )
]

{ #category : 'dependencies' }
BaselineOfFamixCallGraphs >> gitBridge: spec [

	spec baseline: 'GitBridge' with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
]

{ #category : 'accessing' }
BaselineOfFamixCallGraphs >> projectClass [
	^ MetacelloCypressBaselineProject
]

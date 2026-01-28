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
	spec for: #common do: [ "Dependencies"
			self gitBridge: spec.

			"Packages"
			spec
				package: 'Famix-CallGraphs';
				package: 'Famix-CallGraphs-Properties' with: [ spec requires: #( 'Famix-CallGraphs' ) ];
				package: 'Famix-CallGraphs-PathFinder';
				package: 'Famix-CallGraphs-Tests' with: [ spec requires: #( 'Famix-CallGraphs' 'GitBridge' ) ];
				package: 'Famix-CallGraphs-Properties-Tests' with: [ spec requires: #( 'Famix-CallGraphs-Properties' ) ];
				package: 'Famix-CallGraphs-PathFinder-Tests' with: [ spec requires: #( 'Famix-CallGraphs-PathFinder' ) ].

			"Groups"
			spec
				group: 'Core' with: #( 'Famix-CallGraphs' 'Famix-CallGraphs-Properties' );
				group: 'Tests' with: #( 'Famix-CallGraphs-Tests' 'Famix-CallGraphs-Properties-Tests' ) ].

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

"
I am a baseline to define the structure and dependencies of the FamixCallGraph project.
"
Class {
	#name : 'BaselineOfFamixCallGraph',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixCallGraph',
	#package : 'BaselineOfFamixCallGraph'
}

{ #category : 'baselines' }
BaselineOfFamixCallGraph >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
			self gitBridge: spec.

			"Packages"
			spec
				package: 'Famix-CallGraph';
				package: 'Famix-CallGraph-Tests' with: [ spec requires: #( 'Famix-CallGraph' 'GitBridge' ) ].

			"Groups"
			spec
				group: 'Core' with: #( 'Famix-CallGraph' );
				group: 'Tests' with: #( 'Famix-CallGraph-Tests' ) ].

	spec for: #NeedsFamix do: [
			spec baseline: 'Famix' with: [ spec repository: 'github://moosetechnology/Famix:development/src' ].
			spec package: 'Famix-CallGraph' with: [ spec requires: #( Famix ) ] ]
]

{ #category : 'accessing' }
BaselineOfFamixCallGraph >> customProjectAttributes [

	'BaselineOfFamix' asPackageIfAbsent: [ ^ #( #NeedsFamix ) ].
	^ #(  )
]

{ #category : 'dependencies' }
BaselineOfFamixCallGraph >> gitBridge: spec [

	spec baseline: 'GitBridge' with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
]

{ #category : 'accessing' }
BaselineOfFamixCallGraph >> projectClass [
	^ MetacelloCypressBaselineProject
]

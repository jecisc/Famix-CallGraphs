"
I am a way to add additional properties to some callgraph nodes. 

My goal is to add the less memory cost to the callgraph since we are currently working on big models taking a lot of RAM. The cost of the mehod I'm using is that, if we add propeties to a lot of nodes, it might become really slow to access to those properties. If that becomes the state, we might need to implement another way to add those properties. 

The way I am working is that I will have a singleton storing the additional properties of each nodes, idependently of their callgraph. The reason is the I do not want to add an ivar to each node so that they can know their callgraph to not increase the memory too much. 

My implementation is done in a way that I will keep all additional properties of all call graphs present in memory. If you want to reset all additonal properties you can use:

```st
FamixCallGraphAdditionalProperties resetAdditionalProperties
```
"
Class {
	#name : 'FamixCallGraphAdditionalProperties',
	#superclass : 'Object',
	#instVars : [
		'propertiesMap'
	],
	#classVars : [
		'Current'
	],
	#category : 'Famix-CallGraphs-Properties',
	#package : 'Famix-CallGraphs-Properties'
}

{ #category : 'accessing' }
FamixCallGraphAdditionalProperties class >> current [

	^ Current ifNil: [ Current := super new ]
]

{ #category : 'instance creation' }
FamixCallGraphAdditionalProperties class >> new [

	^ self error: 'I am a singleton. You can read my class comment to understand why.'
]

{ #category : 'accessing' }
FamixCallGraphAdditionalProperties class >> resetAdditionalProperties [

	<script>
	Current := nil
]

{ #category : 'accessing' }
FamixCallGraphAdditionalProperties >> at: aNode [

	^ propertiesMap at: aNode
]

{ #category : 'accessing' }
FamixCallGraphAdditionalProperties >> at: aNode ifAbsent: aBlock [

	^ propertiesMap at: aNode ifAbsent: aBlock
]

{ #category : 'accessing' }
FamixCallGraphAdditionalProperties >> at: aNode ifAbsentPut: anotherBlock [

	^ propertiesMap at: aNode ifAbsentPut: anotherBlock
]

{ #category : 'accessing' }
FamixCallGraphAdditionalProperties >> at: aNode ifPresent: aBlock ifAbsent: anotherBlock [

	^ propertiesMap
		  at: aNode
		  ifPresent: aBlock
		  ifAbsent: anotherBlock
]

{ #category : 'initialization' }
FamixCallGraphAdditionalProperties >> initialize [

	super initialize.
	propertiesMap := WeakIdentityKeyDictionary new
]

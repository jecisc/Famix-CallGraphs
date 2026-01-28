"
This resource demonstrates a discrepancy between the static call graph and the dynamic execution flow caused by a state variable. While the direct path exists topologically, it is semantically invalid at runtime because the variable forces a loop. This tests whether the PathFinder returns the shortest structural path (ignoring data state) or attempts to resolve the valid execution trace.
"
Class {
	#name : 'FamixJavaCallGraphPathFinderExample3Resource',
	#superclass : 'FamixAbstractCallGraphPathFinderBuilderTestResource',
	#category : 'Famix-CallGraphs-PathFinder-Tests-Resources',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Resources'
}

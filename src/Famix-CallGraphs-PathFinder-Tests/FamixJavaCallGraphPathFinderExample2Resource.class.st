"
This resource exposes a branching call topology to test multi-path detection. It offers two distinct routes from A2.main to B2.method(String): a direct invocation and a transitive call via B2.method(). Used to verify that the FamixCallGraphPathFinder can resolve and return all valid structural paths between two nodes.
"
Class {
	#name : 'FamixJavaCallGraphPathFinderExample2Resource',
	#superclass : 'FamixAbstractCallGraphPathFinderBuilderTestResource',
	#category : 'Famix-CallGraphs-PathFinder-Tests-Resources',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Resources'
}

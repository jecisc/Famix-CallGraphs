"
A FamixJavaClassHierarchyAnalysisCallGraphBuilderTest is a test class for testing the behavior of FamixJavaClassHierarchyAnalysisCallGraphBuilder
"
Class {
	#name : 'FamixJavaClassHierarchyAnalysisCallGraphBuilderTest',
	#superclass : 'TestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'helpers' }
FamixJavaClassHierarchyAnalysisCallGraphBuilderTest >> model2JSON [
	^ '[{
	"FM3":"Famix-Java-Entities.Package",
	"id":1,
	"name":"io",
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"parentPackage": {"ref": 2}
	},{
	"FM3":"Famix-Java-Entities.SourceLanguage",
	"id":3
	},{
	"FM3":"Famix-Java-Entities.Inheritance",
	"id":4,
	"numberOfLinesOfCode":-1,
	"subclass": {"ref": 5},
	"superclass": {"ref": 6}
	},{
	"FM3":"Famix-Java-Entities.Package",
	"id":2,
	"name":"java",
	"isStub":true,
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":7,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":8,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.ParametricInterface",
	"id":9,
	"name":"Comparable",
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"typeContainer": {"ref": 10},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":11,
	"declaredType": {"ref": 12},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":13,
	"element": {"ref": 14},
	"encoding":"ascii",
	"endPos":151,
	"fileName":"test.java",
	"startPos":110
	},{
	"FM3":"Famix-Java-Entities.Invocation",
	"id":15,
	"candidates":[ {"ref": 16}],
	"numberOfLinesOfCode":-1,
	"receiver": {"ref": 17},
	"sender": {"ref": 18},
	"signature":"toString()"
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":19,
	"element": {"ref": 20},
	"encoding":"ascii",
	"endPos":277,
	"fileName":"test.java",
	"startPos":267
	},{
	"FM3":"Famix-Java-Entities.Class",
	"id":5,
	"name":"String",
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":true,
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"typeContainer": {"ref": 10},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.Implementation",
	"id":21,
	"implementingClass": {"ref": 5},
	"interface": {"ref": 22},
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 23}
	},{
	"FM3":"Famix-Java-Entities.Interface",
	"id":24,
	"name":"Serializable",
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"typeContainer": {"ref": 1},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.Concretization",
	"id":25,
	"numberOfLinesOfCode":-1,
	"triggeringAssociation": {"ref": 26},
	"typeArgument": {"ref": 5},
	"typeParameter": {"ref": 27}
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":28,
	"element": {"ref": 29},
	"encoding":"ascii",
	"endPos":366,
	"fileName":"test.java",
	"startPos":156
	},{
	"FM3":"Famix-Java-Entities.Method",
	"id":30,
	"name":"m",
	"cyclomaticComplexity":1,
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":false,
	"isSynchronized":false,
	"numberOfConditionals":-1,
	"numberOfLinesOfCode":3,
	"parentType": {"ref": 29},
	"signature":"m()",
	"typing": {"ref": 8},
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.Method",
	"id":31,
	"name":"A",
	"cyclomaticComplexity":-1,
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"isSynchronized":false,
	"kind":"constructor",
	"numberOfConditionals":-1,
	"numberOfLinesOfCode":-1,
	"parentType": {"ref": 32},
	"signature":"A()",
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.Invocation",
	"id":33,
	"candidates":[ {"ref": 31}],
	"numberOfLinesOfCode":-1,
	"sender": {"ref": 34},
	"signature":"A()"
	},{
	"FM3":"Famix-Java-Entities.Invocation",
	"id":35,
	"candidates":[ {"ref": 36}],
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 33},
	"sender": {"ref": 34},
	"signature":"B()"
	},{
	"FM3":"Famix-Java-Entities.Inheritance",
	"id":37,
	"numberOfLinesOfCode":-1,
	"subclass": {"ref": 29},
	"superclass": {"ref": 32}
	},{
	"FM3":"Famix-Java-Entities.Class",
	"id":38,
	"name":"B",
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":false,
	"numberOfLinesOfCode":5,
	"typeContainer": {"ref": 39},
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.Method",
	"id":14,
	"name":"m",
	"cyclomaticComplexity":1,
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":false,
	"isSynchronized":false,
	"numberOfConditionals":-1,
	"numberOfLinesOfCode":3,
	"parentType": {"ref": 38},
	"signature":"m()",
	"typing": {"ref": 40},
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":41,
	"element": {"ref": 32},
	"encoding":"ascii",
	"endPos":83,
	"fileName":"test.java",
	"startPos":1
	},{
	"FM3":"Famix-Java-Entities.Invocation",
	"id":42,
	"candidates":[ {"ref": 14}],
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 43},
	"receiver": {"ref": 44},
	"sender": {"ref": 34},
	"signature":"m()"
	},{
	"FM3":"Famix-Java-Entities.LocalVariable",
	"id":44,
	"name":"b",
	"isFinal":false,
	"isStub":false,
	"numberOfLinesOfCode":1,
	"parentBehaviouralEntity": {"ref": 34},
	"typing": {"ref": 45}
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":46,
	"declaredType": {"ref": 12},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.Package",
	"id":39,
	"name":"<Default Package>",
	"isStub":false,
	"numberOfLinesOfCode":24
	},{
	"FM3":"Famix-Java-Entities.Package",
	"id":47,
	"name":"constant",
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"parentPackage": {"ref": 10}
	},{
	"FM3":"Famix-Java-Entities.ParametricImplementation",
	"id":26,
	"implementingClass": {"ref": 5},
	"interface": {"ref": 9},
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 48}
	},{
	"FM3":"Famix-Java-Entities.ImplicitVariable",
	"id":17,
	"name":"self",
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"parentBehaviouralEntity": {"ref": 18}
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":49,
	"declaredType": {"ref": 32},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.Method",
	"id":18,
	"name":"m",
	"cyclomaticComplexity":1,
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":false,
	"isSynchronized":false,
	"numberOfConditionals":-1,
	"numberOfLinesOfCode":3,
	"parentType": {"ref": 32},
	"signature":"m()",
	"typing": {"ref": 7},
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":50,
	"element": {"ref": 34},
	"encoding":"ascii",
	"endPos":364,
	"fileName":"test.java",
	"startPos":229
	},{
	"FM3":"Famix-Java-Entities.Class",
	"id":6,
	"name":"Object",
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"typeContainer": {"ref": 10}
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":40,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.Inheritance",
	"id":51,
	"numberOfLinesOfCode":-1,
	"subclass": {"ref": 38},
	"superclass": {"ref": 32}
	},{
	"FM3":"Famix-Java-Entities.Method",
	"id":16,
	"name":"toString",
	"cyclomaticComplexity":-1,
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"isSynchronized":false,
	"numberOfConditionals":-1,
	"numberOfLinesOfCode":-1,
	"parentType": {"ref": 6},
	"signature":"toString()",
	"typing": {"ref": 52},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.Class",
	"id":29,
	"name":"C",
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":false,
	"numberOfLinesOfCode":14,
	"typeContainer": {"ref": 39},
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":53,
	"element": {"ref": 18},
	"encoding":"ascii",
	"endPos":81,
	"fileName":"test.java",
	"startPos":30
	},{
	"FM3":"Famix-Java-Entities.Inheritance",
	"id":54,
	"numberOfLinesOfCode":-1,
	"subclass": {"ref": 32},
	"superclass": {"ref": 6}
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":45,
	"declaredType": {"ref": 38},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":55,
	"element": {"ref": 38},
	"encoding":"ascii",
	"endPos":153,
	"fileName":"test.java",
	"startPos":86
	},{
	"FM3":"Famix-Java-Entities.Invocation",
	"id":43,
	"candidates":[ {"ref": 18}],
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 35},
	"receiver": {"ref": 20},
	"sender": {"ref": 34},
	"signature":"m()"
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":56,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.Interface",
	"id":57,
	"name":"ConstantDesc",
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"typeContainer": {"ref": 47},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.Interface",
	"id":22,
	"name":"Constable",
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"typeContainer": {"ref": 47},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.Implementation",
	"id":23,
	"implementingClass": {"ref": 5},
	"interface": {"ref": 58},
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 26}
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":59,
	"element": {"ref": 44},
	"encoding":"ascii",
	"endPos":300,
	"fileName":"test.java",
	"startPos":290
	},{
	"FM3":"Famix-Java-Entities.TypeParameter",
	"id":27,
	"name":"T",
	"genericEntity": {"ref": 9},
	"isStub":false,
	"numberOfLinesOfCode":0,
	"typeContainer": {"ref": 9},
	"upperBound": {"ref": 6}
	},{
	"FM3":"Famix-Java-Entities.Implementation",
	"id":60,
	"implementingClass": {"ref": 5},
	"interface": {"ref": 57},
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 21}
	},{
	"FM3":"Famix-Java-Entities.Access",
	"id":61,
	"accessor": {"ref": 18},
	"isWrite":false,
	"numberOfLinesOfCode":-1,
	"variable": {"ref": 17}
	},{
	"FM3":"Famix-Java-Entities.Implementation",
	"id":48,
	"implementingClass": {"ref": 5},
	"interface": {"ref": 24},
	"numberOfLinesOfCode":-1,
	"previous": {"ref": 4}
	},{
	"FM3":"Famix-Java-Entities.Class",
	"id":32,
	"name":"A",
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":false,
	"numberOfLinesOfCode":5,
	"typeContainer": {"ref": 39},
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":62,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.PrimitiveType",
	"id":12,
	"name":"void",
	"isStub":true,
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.Package",
	"id":10,
	"name":"lang",
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"parentPackage": {"ref": 2}
	},{
	"FM3":"Famix-Java-Entities.LocalVariable",
	"id":20,
	"name":"a",
	"isFinal":false,
	"isStub":false,
	"numberOfLinesOfCode":1,
	"parentBehaviouralEntity": {"ref": 34},
	"typing": {"ref": 49}
	},{
	"FM3":"Famix-Java-Entities.Method",
	"id":36,
	"name":"B",
	"cyclomaticComplexity":-1,
	"isAbstract":false,
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"isSynchronized":false,
	"kind":"constructor",
	"numberOfConditionals":-1,
	"numberOfLinesOfCode":-1,
	"parentType": {"ref": 38},
	"signature":"B()",
	"visibility":"package"
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":63,
	"element": {"ref": 30},
	"encoding":"ascii",
	"endPos":222,
	"fileName":"test.java",
	"startPos":180
	},{
	"FM3":"Famix-Java-Entities.LocalVariable",
	"id":64,
	"name":"s",
	"isFinal":false,
	"isStub":false,
	"numberOfLinesOfCode":1,
	"parentBehaviouralEntity": {"ref": 34},
	"typing": {"ref": 65}
	},{
	"FM3":"Famix-Java-Entities.Interface",
	"id":58,
	"name":"CharSequence",
	"isClassSide":false,
	"isFinal":false,
	"isStub":true,
	"numberOfLinesOfCode":-1,
	"typeContainer": {"ref": 10},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":65,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":52,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.EntityTyping",
	"id":66,
	"declaredType": {"ref": 5},
	"numberOfLinesOfCode":-1
	},{
	"FM3":"Famix-Java-Entities.Method",
	"id":34,
	"name":"main",
	"cyclomaticComplexity":1,
	"isAbstract":false,
	"isClassSide":true,
	"isFinal":false,
	"isStub":false,
	"isSynchronized":false,
	"numberOfConditionals":-1,
	"numberOfLinesOfCode":8,
	"parentType": {"ref": 29},
	"signature":"main()",
	"typing": {"ref": 46},
	"visibility":"public"
	},{
	"FM3":"Famix-Java-Entities.IndexedFileAnchor",
	"id":67,
	"element": {"ref": 64},
	"encoding":"ascii",
	"endPos":318,
	"fileName":"test.java",
	"startPos":318
	}
]'
]

{ #category : 'helpers' }
FamixJavaClassHierarchyAnalysisCallGraphBuilderTest >> modelExampleWithSimpleClassHierarchy [
	"
	class A { foo(){...} }
	
	class B extends A { foo(){...} }
	
	class C extends B { foo(){...} }
	
	class D extends B { foo(){...} }
	
	class Main { 
	
	static void main(){
		B b1 = new B();
		A a1 = new A();
		f(b1);
		g(b1);
	}
	
	static void f(A a2){
			a2.foo();
		}

	static void g(B b2){
			B b3 = b2;
			b3 = new C();
			b3.foo();
		}
	 }
	
	=============================================
	
	A
	
	"

	| model cA cB cC cD cMain fooA fooB fooC fooD main f g |
	model := FamixJavaModel named: 'Example1'.

	cA := FamixJavaClass named: 'A' model: model.
	cB := FamixJavaClass named: 'B' model: model.
	cC := FamixJavaClass named: 'C' model: model.
	cD := FamixJavaClass named: 'D' model: model.
	cMain := FamixJavaClass named: 'Main' model: model.

	FamixJavaInheritance source: cB target: cA model: model.
	FamixJavaInheritance source: cC target: cB model: model.
	FamixJavaInheritance source: cD target: cB model: model.

	fooA := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cA;
		        signature: 'foo()';
		        yourself.

	fooB := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cB;
		        signature: 'foo()';
		        yourself.

	fooC := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cC;
		        signature: 'foo()';
		        yourself.

	fooD := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cD;
		        signature: 'foo()';
		        yourself.

	main := (FamixJavaMethod named: 'main' model: model)
		        parentType: cD;
		        signature: 'main()';
		        yourself.

	f := (FamixJavaMethod named: 'f' model: model)
		     parentType: cD;
		     signature: 'f(A a2)';
		     yourself.

	g := (FamixJavaMethod named: 'g' model: model)
		     parentType: cD;
		     signature: 'g(B b2)';
		     yourself.

	FamixJavaInvocation source: main target: { f } model: model.
	FamixJavaInvocation source: main target: { g } model: model.
	FamixJavaInvocation source: f target: { fooA } model: model.
	FamixJavaInvocation source: g target: { fooB } model: model.

	^ model
]

{ #category : 'helpers' }
FamixJavaClassHierarchyAnalysisCallGraphBuilderTest >> modelExampleWithSimpleClassHierarchy2 [
	"
class A extends Object {
    String m() {
        return (this.toString());
    }
}

class B extends A {
    String m() {
        return ""Hello"";
    }
}

class C extends A {
    String m() {
        return ""Hello2"";
    }

    public static void main() {
        A a = new A();
        B b = new B();
        String s;

        s = a.m();
        s = b.m();
    }
}"

	^ self model2JSON readStreamDo: [ :stream | FamixJavaModel new importFromJSONStream: stream ]
]

{ #category : 'tests' }
FamixJavaClassHierarchyAnalysisCallGraphBuilderTest >> testSimple [

	self modelExampleWithSimpleClassHierarchy.
	self flag: #todo
]

{ #category : 'tests' }
FamixJavaClassHierarchyAnalysisCallGraphBuilderTest >> testSimple2 [

	| model |
	model := self modelExampleWithSimpleClassHierarchy2.
	(FamixJavaClassHierarchyAnalysisCallGraphBuilder entryPoint: (model allMethods detect: [ :method | method name = 'main' ])) build
]

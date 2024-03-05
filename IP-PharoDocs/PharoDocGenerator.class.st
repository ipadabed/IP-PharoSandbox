"
Here's a Pharo class that generates a JavaDoc-like documentation for classes in a given package
"
Class {
	#name : #PharoDocGenerator,
	#superclass : #Object,
	#instVars : [
		'inputPackage'
	],
	#category : #'IP-PharoDocs'
}

{ #category : #queries }
PharoDocGenerator >> checkMethodForSender: aMethod atMethod: targetMethod [
"
	| sourceCode match aSenders |
	aSenders := OrderedCollection new.
	sourceCode := aMethod sourceCode asString. "" Convert to string for easier searching ""

	match := sourceCode
		         match: targetMethod selector asString
		         followedBy: [ :char | char ~= '.' ]. "" Basic pattern matching ""

	match ifNotNil: [ aSenders add: aMethod ].
	^ aSenders"
]

{ #category : #action }
PharoDocGenerator >> documentClass: aClass on: aStream [
    | superclass subclasses instanceVariables methodSenders |

    aStream
        nextPutAll: 'Class: '; nextPutAll: aClass name; cr.
    aStream nextPutAll: 'Superclass: '; nextPutAll: aClass superclass name; cr.

    superclass := aClass superclass.
    subclasses := (superclass subclasses reject: [ :cls | cls == aClass ]) asArray.
    subclasses = #() ifFalse: [ aStream nextPutAll: 'Subclasses: '; print: subclasses; cr ].

    aStream nextPutAll: 'Instance Variables:'; cr.
    instanceVariables := aClass allInstVarNames.
    instanceVariables do: [ :eachVar |
       aStream nextPutAll: '  '; nextPutAll: eachVar; nextPutAll: ' (used in: '.
       methodSenders := aClass methods select: [ :method | aClass includesSelector: eachVar ].
       aStream print: methodSenders; nextPutAll: ')'; cr
    ].

    aStream nextPutAll: 'Methods:'; cr.
    aClass selectors do: [ :selector |
        aStream nextPutAll: '  '; nextPutAll: selector; cr
    ].
    aStream cr
]

{ #category : #queries }
PharoDocGenerator >> findSendersInClass: aClass atMethod: aMethod [

	| superclass methods |
	superclass := aClass superclass.
	methods := aClass methods.

	methods do: [ :eachMethod |
		self checkMethodForSender: eachMethod atMethod: aMethod ].

	superclass ifNotNil: [
		self findSendersInClass: superclass atMethod: aMethod ]
]

{ #category : #initalize }
PharoDocGenerator >> generateDocsFor: aPackage [
    | classes documentation |
    inputPackage := RPackageOrganizer default packageNamed: aPackage.
    classes := inputPackage classes.
    documentation := String new writeStream.

    classes do: [ :eachClass |
        self documentClass: eachClass on: documentation
    ].

    ^ documentation contents
]

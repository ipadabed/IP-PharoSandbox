Class {
	#name : #PharoDocsTests,
	#superclass : #TestCase,
	#category : #'IP-PharoDocs-Tests'
}

{ #category : #running }
PharoDocsTests >> setUp [
	super setUp.
	^ PharoDocGenerator new
]

{ #category : #tests }
PharoDocsTests >> testGenerateDocForIPPharoMatrix [ 
    | docGenerator documentation |

    docGenerator := self setUp.

    documentation := docGenerator generateDocsFor: 'IP-PharoMatrix'.

	 "Live view for tracing purpose"
	 Transcript show: documentation.
	
    self assert: documentation notNil.  " Ensure documentation is generated "
    " You can further assert the content of the documentation based on your expectations"
]

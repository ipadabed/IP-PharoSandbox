Class {
	#name : #MatrixTest,
	#superclass : #TestCase,
	#category : #'IP-PharoTestTaskSamples-Tests'
}

{ #category : #running }
MatrixTest >> setUp [
	super setUp.
	^ Matrix new
]

{ #category : #running }
MatrixTest >> testClassicToHollowMatrix [
	" Test: Setting a classic matrix and verifying its hollow matrix representation"

	| myMatrix aClassicMatrix |
	myMatrix := self setUp. " Create a new Matrix instance "

	aClassicMatrix := #( #( 0 2 0 ) #( 0 3 0 ) #( 4 0 5 ) ).
	myMatrix matrix: aClassicMatrix. " Set the matrix using classic representation "
	self
		assert: myMatrix hollowMatrix
		equals:
		#( #( 1 2 2 ) #( 2 2 3 ) #( 3 1 4 ) #( 3 3 5 ) )
]

{ #category : #running }
MatrixTest >> testHollowToClassicMatrix [
	" Test: Setting a hollow matrix and verifying its classic matrix representation"

	| myMatrix aHollowMatrix |
	myMatrix := self setUp.

	aHollowMatrix := #( #( 1 1 1 ) #( 2 2 2 ) #( 3 2 3 ) #( 1 3 4 ) ).
	myMatrix hollowMatrix: aHollowMatrix. " Set the matrix using hollow representation "
	self
		assert: myMatrix matrix
		equals: #( #( 1 0 4 ) #( 0 2 0 ) #( 0 3 0 ) )
]

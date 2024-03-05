"
This class represents a matrix and provides methods to manage its internal representation and conversion between classic and hollow formats.
"
Class {
	#name : #Matrix,
	#superclass : #Object,
	#instVars : [
		'matrix'
	],
	#category : #'IP-PharoTestTaskSamples'
}

{ #category : #'add method - selector' }
Matrix >> convertToClassicMatrix: aHollowMatrix [
    "Calculates the required dimensions for the classic matrix based on the maximum row and column values in the hollow matrix.
     Creates a classic matrix filled with zeros and then iterates through the hollow matrix elements, populating the corresponding positions in the classic matrix."

	| classicMatrix rowSize colSize row col value |
	rowSize := 1.
	colSize := 1.
	"finding target matrix dimensions assuming that we don't need whole row or column if it is filled by zeroes and it is right/bottom side"
	1 to: aHollowMatrix size do: [ :ind |
		rowSize := rowSize max: ((aHollowMatrix at: ind) at: 1).
		colSize := colSize max: ((aHollowMatrix at: ind) at: 2) ].

	"populate target matrix with zeroes"
	classicMatrix := Array new: rowSize.
	1 to: colSize do: [ :ind |
	classicMatrix at: ind put: (Array new: colSize withAll: 0) ].

	"populate target matrix with non-zero value"
	1 to: aHollowMatrix size do: [ :ind |
		row := (aHollowMatrix at: ind) at: 1.
		col := (aHollowMatrix at: ind) at: 2.
		value := (aHollowMatrix at: ind) at: 3.
		(classicMatrix at: row) at: col put: value.].
 ^classicMatrix
]

{ #category : #'add method - selector' }
Matrix >> convertToHollowMatrix: aMatrix [
    "Iterates through each element in the classic matrix and adds non-zero elements as tuples (row, col, value) to a new OrderedCollection."

	| hollowMatrix value |
	hollowMatrix := OrderedCollection new.
  	1 to: aMatrix size do: [:row |
    1 to: (aMatrix at: 1) size  do: [:col |
      value := (aMatrix at: row) at: col.
      value = 0 ifFalse: [hollowMatrix add: {row. col. value}]
    ]
  ].
^hollowMatrix asArray.
]

{ #category : #accessing }
Matrix >> hollowMatrix [ 
	^ self convertToHollowMatrix: matrix

]

{ #category : #accessing }
Matrix >> hollowMatrix: aHollowMatrix [
    "Sets the matrix using the provided hollow matrix representation.
     Internally converts the hollow matrix to a classic representation and then calls the private method to initialize the matrix."
    self initializeMatrixWith: (self convertToClassicMatrix: aHollowMatrix)
]

{ #category : #accessing }
Matrix >> initializeMatrixWith: aMatrixRepresentation [
    "Sets the internal matrix instance variable with the provided representation."
    matrix := aMatrixRepresentation.

]

{ #category : #accessing }
Matrix >> matrix [
	^ matrix
]

{ #category : #accessing }
Matrix >> matrix: aMatrix [
    "Sets the matrix using the provided classic 2D array representation.
     Internally calls the private method to initialize the matrix."
    self initializeMatrixWith: aMatrix.
]

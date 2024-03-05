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
Matrix >> convertToClassicMatrix: aMatrix [
	"takes a hollow matrix (aMatrix) defined as a vector of tuples (row, col, value) and converts it to a vector of vectors"

	| classicMatrix rowSize colSize row col value |
	rowSize := 1.
	colSize := 1.
	"finding target matrix dimensions assuming that we don't need whole row or column if it is filled by zeroes and it is right/bottom side"
	1 to: aMatrix size do: [ :ind |
		rowSize := rowSize max: ((aMatrix at: ind) at: 1).
		colSize := colSize max: ((aMatrix at: ind) at: 2) ].

	"populate target matrix with zeroes"
	classicMatrix := Array new: rowSize.
	1 to: colSize do: [ :ind |
	classicMatrix at: ind put: (Array new: colSize withAll: 0) ].

	"populate target matrix with non-zero value"
	1 to: aMatrix size do: [ :ind |
		row := (aMatrix at: ind) at: 1.
		col := (aMatrix at: ind) at: 2.
		value := (aMatrix at: ind) at: 3.
		(classicMatrix at: row) at: col put: value.].
 ^classicMatrix
]

{ #category : #'add method - selector' }
Matrix >> convertToHollowMatrix: aMatrix [
	"takes clsssic matrix (aMatrix) defined as a vector of vectors and converts it to a set of tuples"

	| hollowMatrix value |
	hollowMatrix := OrderedCollection new.
  	1 to: aMatrix size do: [:row |
    1 to: (aMatrix at: 1) size  do: [:col |
      value := (aMatrix at: row) at: col.
      value = 0 ifFalse: [hollowMatrix add: {row. col. value}]
    ]
  ].
^hollowMatrix 
]

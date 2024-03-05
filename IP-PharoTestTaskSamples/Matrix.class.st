" This class represents a matrix and provides methods to manage its internal representation and conversion between classic and hollow formats."

Class {
	#name : #Matrix,
	#superclass : #Object,
	#instVars : [
		'matrix' " Stores the matrix data in a classic 2D array representation."
	],
	#category : #'IP-PharoTestTaskSamples'
}

{ #category : #'add method - selector' }

" Accessor for the matrix representation in classic 2D array format"
matrix ^ matrix

" Setter for the matrix representation using a classic 2D array"
matrix: aMatrix
    "Sets the matrix using the provided classic 2D array representation.
     Internally calls the private method to initialize the matrix."
    self private: #initializeMatrixWith: aMatrix.

" Accessor for the hollow matrix representation as an OrderedCollection of tuples (row, col, value)"
hollowMatrix ^ self convertToHollowMatrix(matrix)

" Setter for the hollow matrix representation using an OrderedCollection of tuples (row, col, value)"
hollowMatrix: aHollowMatrix
    "Sets the matrix using the provided hollow matrix representation.
     Internally converts the hollow matrix to a classic representation and then calls the private method to initialize the matrix."
    self private: #initializeMatrixWith: (self convertToClassicMatrix(aHollowMatrix))

!Matrix methodsFor: 'private' stamp: 'refactored 2024-03-05'!

" Initializes the matrix with the provided representation (classic or hollow after conversion)"
initializeMatrixWith: aMatrixRepresentation
    "Sets the internal matrix instance variable with the provided representation."
    matrix := aMatrixRepresentation.

" Converts the classic matrix (2D array) to a hollow matrix representation (OrderedCollection of tuples)"
convertToHollowMatrix: aMatrix
    "Iterates through each element in the classic matrix and adds non-zero elements as tuples (row, col, value) to a new OrderedCollection."

    | hollowMatrix value |
    hollowMatrix := OrderedCollection new.
    1 to: aMatrix size do: [:row ->
        1 to: (aMatrix at: row) size do: [:col ->
            value := (aMatrix at: row) at: col.
            value ~= 0 ifTrue: [hollowMatrix add: {row. col. value}]  " Add only non-zero elements "
        ]
    ].
    ^ hollowMatrix

" Converts the hollow matrix representation (OrderedCollection of tuples) to a classic matrix (2D array)"
convertToClassicMatrix: aHollowMatrix
    "Calculates the required dimensions for the classic matrix based on the maximum row and column values in the hollow matrix.
     Creates a classic matrix filled with zeros and then iterates through the hollow matrix elements, populating the corresponding positions in the classic matrix."

    | classicMatrix rowSize colSize row col value |
    rowSize := 1.
    colSize := 1.
    " Find the maximum row and column values from the hollow matrix "
    1 to: aHollowMatrix size do: [ :ind |
        rowSize := rowSize max: ((aHollowMatrix at: ind) at: 1).
        colSize := colSize max: ((aHollowMatrix at: ind) at: 2)
    ].

    " Create a classic matrix filled with zeros"
    classicMatrix := Array new: rowSize.
    1 to: colSize do: [ :ind |
        classicMatrix at: ind put: (Array new: colSize withAll: 0)
    ].

    " Populate the classic matrix with non-zero values from the hollow matrix"
    1 to: aHollowMatrix size do: [ :ind |
        row := (aHollowMatrix at: ind) at: 1.
        col := (aHollowMatrix at: ind) at: 2.
        value := (aHollowMatrix at: ind) at: 3.
        (classicMatrix at: row) at: col put: value.
    ].
    ^ classicMatrix


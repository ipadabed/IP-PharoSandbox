Class {
	#name : #IPSamplesExecutor,
	#superclass : #Object,
	#instVars : [
		'sampleMatrix'
	],
	#category : #'IP-PharoTestTaskSamples'
}

{ #category : #'instance creation' }
IPSamplesExecutor >> fromClassicToHollowSample [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	| classicMatrix executor |
	classicMatrix := #(#(0 9 0) #(6 0 6) #(0 3 0)).
	executor := IPHollowMatrixSamples new.
	
	executor convertToHollowMatrix: classicMatrix.
]

{ #category : #'instance creation' }
IPSamplesExecutor >> fromHollowToClassicSample [
	"performs a conversion of the sample matrix to hollow format"

	| hollowMatrix executor |
	hollowMatrix := #(#(1 2 3) #(2 1 2) #(3 3 1)).
	executor := IPHollowMatrixSamples new.
	
	executor convertToClassicMatrix: hollowMatrix.
]

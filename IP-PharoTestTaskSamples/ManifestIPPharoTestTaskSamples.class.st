"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIPPharoTestTaskSamples,
	#superclass : #PackageManifest,
	#category : #'IP-PharoTestTaskSamples-Manifest'
}

{ #category : #'code-critics' }
ManifestIPPharoTestTaskSamples class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'IP-HollowMatrixSamples')) #'2024-03-02T02:08:09.389069+00:00') )
]

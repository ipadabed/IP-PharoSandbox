"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIPPharoDocsTests,
	#superclass : #PackageManifest,
	#category : #'IP-PharoDocs-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestIPPharoDocsTests class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#PharoDocsTests #testGenerateDocForIPPharoMatrix #false)) #'2024-03-05T03:07:53.205819+00:00') )
]

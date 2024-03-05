"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIPPharoDocs,
	#superclass : #PackageManifest,
	#category : #'IP-PharoDocs-Manifest'
}

{ #category : #'code-critics' }
ManifestIPPharoDocs class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#PharoDocGenerator #generateDocsFor: #false)) #'2024-03-05T03:01:28.369934+00:00') )
]

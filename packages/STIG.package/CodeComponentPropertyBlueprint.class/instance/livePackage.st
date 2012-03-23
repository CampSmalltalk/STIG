livePackage

	^isBundle
		ifTrue: [Store.Registry bundleNamed: codeComponentName]
		ifFalse: [Store.Registry packageNamed: codeComponentName]
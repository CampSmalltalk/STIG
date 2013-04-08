"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: accessing
"
livePackage

	^isBundle
		ifTrue: [Store.Registry bundleNamed: codeComponentName]
		ifFalse: [Store.Registry packageNamed: codeComponentName]
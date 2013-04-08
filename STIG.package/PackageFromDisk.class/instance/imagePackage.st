"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: image-updating
"
imagePackage

	^(Store.Registry packageNamed: self packageName)
		ifNil: [Store.PackageModel named: packageName]
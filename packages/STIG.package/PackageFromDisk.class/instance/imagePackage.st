image-updating
imagePackage

	^(Store.Registry packageNamed: self packageName)
		ifNil: [Store.PackageModel named: packageName]
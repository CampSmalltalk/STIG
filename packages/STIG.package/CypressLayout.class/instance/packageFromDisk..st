packageFromDisk: name

	^(PackageFromDisk directory: self root / (name, '.package'))
		packageName: name;
		yourself
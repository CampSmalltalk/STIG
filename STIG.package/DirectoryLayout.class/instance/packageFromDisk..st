accessing
packageFromDisk: name

	^(PackageFromDisk directory: self root / name)
		packageName: name;
		yourself
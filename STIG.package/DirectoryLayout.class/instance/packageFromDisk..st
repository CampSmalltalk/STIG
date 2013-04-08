"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: accessing
"
packageFromDisk: name

	^(PackageFromDisk directory: self root / name)
		packageName: name;
		yourself
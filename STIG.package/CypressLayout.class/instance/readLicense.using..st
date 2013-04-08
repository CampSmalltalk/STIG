"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readLicense: aFilename using: fromDisk

	| blueprint |
	blueprint := CodeComponentPropertyBlueprint new.
	blueprint key: #notice.
	blueprint original: aFilename.
	blueprint value: (fromDisk fileContents: aFilename).
	fromDisk addBlueprint: blueprint.
	^fromDisk
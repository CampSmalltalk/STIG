readProperties: aFilename using: fromDisk

	| properties |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	properties keysAndValuesDo: [ :key :value || blueprint |
		blueprint := CodeComponentPropertyBlueprint new.
		blueprint key: key asSymbol.
		blueprint original: aFilename.
		blueprint value: value.
		fromDisk addBlueprint: blueprint].
	^fromDisk
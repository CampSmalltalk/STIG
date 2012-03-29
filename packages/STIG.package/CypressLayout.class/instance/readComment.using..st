readComment: aFilename using: fromDisk

	| blueprint |
	blueprint := CodeComponentPropertyBlueprint new.
	blueprint key: #comment.
	blueprint original: aFilename.
	blueprint value: (fromDisk fileContents: aFilename).
	fromDisk addBlueprint: blueprint.
	^fromDisk
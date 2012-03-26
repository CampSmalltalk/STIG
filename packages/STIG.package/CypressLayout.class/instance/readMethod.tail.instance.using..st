readMethod: aFilename tail: aTail instance: isInstance using: fromDisk

	| blueprint properties |
	properties := fromDisk fileContents: (aFilename directory / ((aTail allButLast: 2), 'json')).
	properties := JSON read: properties readStream.
	blueprint := MethodBlueprint of: aFilename.
	blueprint isInstanceBehavior: isInstance.
	blueprint classReference: fromDisk reference.
	blueprint selector: (self decodeSelector: aTail) asSymbol.
	blueprint category: (properties at: 'category').
	blueprint source: (fromDisk fileContents: aFilename).
	fromDisk addBlueprint: blueprint.
	^fromDisk
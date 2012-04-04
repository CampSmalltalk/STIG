loading
readMethod: aFilename tail: aTail instance: isInstance using: fromDisk

	| blueprint selector source |
	selector := aTail allButLast: 3.
	source := (fromDisk fileContents: aFilename) readStream.
	blueprint := MethodBlueprint of: aFilename.
	blueprint isInstanceBehavior: isInstance.
	blueprint classReference: fromDisk reference.
	blueprint selector: (self decodeSelector: selector) asSymbol.
	blueprint category: (source upTo: Character cr).
	blueprint source: source upToEnd.
	fromDisk addBlueprint: blueprint.
	^fromDisk
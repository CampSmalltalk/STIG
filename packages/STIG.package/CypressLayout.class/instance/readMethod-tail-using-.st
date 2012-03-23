readMethod: aFilename tail: aTail using: fromDisk

	| blueprint rs |
	blueprint := MethodBlueprint of: aFilename.
	aTail first = $0
		ifTrue: [^fromDisk]
		ifFalse: 
			[aTail first = $^
				ifTrue: [blueprint isInstanceBehavior: false]
				ifFalse: [blueprint isInstanceBehavior: true]].
	blueprint classReference: fromDisk reference.
	blueprint selector: (fromDisk decodeSelector: (aTail allButFirst: 1)) asSymbol.
	rs := (fromDisk fileContents: aFilename) readStream.
	blueprint category: (rs upTo: Character cr).
	blueprint source: rs upToEnd.
	fromDisk addBlueprint: blueprint.
	^fromDisk
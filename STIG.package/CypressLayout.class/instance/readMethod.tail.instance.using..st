"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readMethod: aFilename tail: aTail instance: isInstance using: fromDisk

	| blueprint selector source |
	selector := aTail allButLast: 3.
	source := (fromDisk fileContents: aFilename) readStream.
	blueprint := MethodBlueprint of: aFilename.
	blueprint isInstanceBehavior: isInstance.
	blueprint classReference: fromDisk reference.
	blueprint selector: (self decodeSelector: selector) asSymbol.
	(source upTo: Character cr) = '"' ifFalse: [ self error: 'method file format error!' ].
	(source upTo: Character space) = 'notice:' ifFalse: [ self error: 'method file format error!' ].
	source upTo: Character cr.
	(source upTo: Character space) = 'category:' ifFalse: [ self error: 'method file format error!' ].
	blueprint category: (source upTo: Character cr).
	(source upTo: Character cr) = '"' ifFalse: [ self error: 'method file format error!' ].
	blueprint source: source upToEnd.
	fromDisk addBlueprint: blueprint.
	^fromDisk
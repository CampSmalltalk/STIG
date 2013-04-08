"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readSharedVariable: aFilename using: fromDisk

	| blueprint properties reference |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	reference := self makeReference: properties.
	blueprint := SharedVariableBlueprint new.
	blueprint original: aFilename.
	blueprint reference: reference.
	blueprint category: (properties at: 'category' ifAbsent: [ nil ]).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [ false ]).
	blueprint isConstant: (properties at: 'constant' ifAbsent: [ false ]).
	blueprint initializer: (properties at: 'initializer' ifAbsent: [ nil ]).
	fromDisk addBlueprint: blueprint.
	^fromDisk
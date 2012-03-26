readSharedVariable: aFilename using: fromDisk

	| blueprint properties |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	blueprint := SharedVariableBlueprint new.
	blueprint original: aFilename.
	blueprint reference: (self referenceFrom: properties super: false).
	blueprint category: (properties at: 'category' ifAbsent: [ nil ]).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [ false ]).
	blueprint isConstant: (properties at: 'constant' ifAbsent: [ false ]).
	blueprint initializer: (properties at: 'initializer' ifAbsent: [ nil ]).
	fromDisk addBlueprint: blueprint.
	^fromDisk
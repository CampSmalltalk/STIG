loading
readSharedVariable: aFilename using: fromDisk

	| blueprint properties reference |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	reference := ((properties at: 'namespace' ifAbsent: [nil]) ifNil: [''] ifNotNil: [ :ns | ns, '.' ]), (properties at: 'name').
	reference := reference asQualifiedReference makeUnambiguous.
	blueprint := SharedVariableBlueprint new.
	blueprint original: aFilename.
	blueprint reference: reference.
	blueprint category: (properties at: 'category' ifAbsent: [ nil ]).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [ false ]).
	blueprint isConstant: (properties at: 'constant' ifAbsent: [ false ]).
	blueprint initializer: (properties at: 'initializer' ifAbsent: [ nil ]).
	fromDisk addBlueprint: blueprint.
	^fromDisk
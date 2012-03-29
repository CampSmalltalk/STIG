readNamespace: aFilename using: fromDisk

	| blueprint properties file reference |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	reference := ((properties at: 'namespace' ifAbsent: [nil]) ifNil: [''] ifNotNil: [ :ns | ns, '.' ]), (properties at: 'name').
	reference := reference asQualifiedReference makeUnambiguous.
	fromDisk reference: reference.
	blueprint := NamespaceBlueprint new.
	blueprint original: aFilename.
	blueprint reference: reference.
	blueprint importsString: (self decodeImportsString: (properties at: 'imports' ifAbsent: [''])).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [ false ]).
	blueprint comment: ((file := aFilename directory / CommentFile) exists ifTrue: [fromDisk fileContents: file] ifFalse: ['']).
	fromDisk addBlueprint: blueprint.
	^fromDisk
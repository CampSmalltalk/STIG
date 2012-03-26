readNamespace: aFilename using: fromDisk

	| blueprint properties file |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	blueprint := NamespaceBlueprint new.
	blueprint original: aFilename.
	blueprint reference: (self referenceFrom: properties super: false).
	blueprint importsString: (self decodeImportsString: (properties at: 'imports' ifAbsent: [''])).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [ false ]).
	blueprint comment: ((file := aFilename directory / CommentFile) exists ifTrue: [fromDisk fileContents: file] ifFalse: ['']).
	fromDisk reference: blueprint reference; addBlueprint: blueprint.
	^fromDisk
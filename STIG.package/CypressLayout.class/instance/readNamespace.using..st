"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readNamespace: aFilename using: fromDisk

	| blueprint properties file reference |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	reference := self makeReference: properties.
	fromDisk reference: reference.
	blueprint := NamespaceBlueprint new.
	blueprint original: aFilename.
	blueprint reference: reference.
	blueprint importsString: (self decodeImportsString: (properties at: 'imports' ifAbsent: [''])).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [ false ]).
	blueprint comment: ((file := aFilename directory / self commentFile) exists ifTrue: [fromDisk fileContents: file] ifFalse: ['']).
	fromDisk addBlueprint: blueprint.
	^fromDisk
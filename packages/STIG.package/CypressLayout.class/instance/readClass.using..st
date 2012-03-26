readClass: aFilename using: fromDisk

	| blueprint properties file |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	blueprint := ClassBlueprint new.
	blueprint original: aFilename.
	blueprint reference: (self referenceFrom: properties super: false).
	blueprint importsString: (self decodeImportsString: (properties at: 'imports' ifAbsent: [''])).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [ false ]).
	blueprint instanceVariables: (properties at: 'instvars' ifAbsent: [Array new]).
	blueprint classInstanceVariables: (properties at: 'classinstvars' ifAbsent: [Array new]).
	blueprint attributes: (properties at: 'attributes' ifAbsent: [ Array new ]).
	blueprint behaviorType: (properties at: 'type' ifAbsent: [ #none ]).
	blueprint comment: ((file := aFilename directory / CommentFile) exists ifTrue: [fromDisk fileContents: file] ifFalse: ['']).
	blueprint superclassReference: (self referenceFrom: properties super: true).
	fromDisk reference: blueprint reference; addBlueprint: blueprint.
	^fromDisk
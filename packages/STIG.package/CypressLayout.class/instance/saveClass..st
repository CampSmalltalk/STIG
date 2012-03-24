saveClass: blueprint

	| path name properties |
	name := blueprint reference name.
	path := (Array with: blueprint packageName, '.package' with: name, '.class').
	blueprint comment size = 0 ifFalse: [
		self path: path tail: 'README' write: [ :ws |
			ws nextPutAll: 'comment:'.
			ws cr.
			ws nextPutAll: blueprint comment] ].
	properties := Dictionary new.
	properties at: 'name' put: blueprint reference name.
	blueprint reference environment == Smalltalk ifFalse: [
		properties at: 'namespace' put: blueprint reference environment fullName ].
	blueprint superclassReference ifNotNil: [ | ns |
		properties at: 'super' put: blueprint superclassReference name.
		(ns := blueprint superclassReference environment) == Smalltalk ifFalse: [
			properties at: 'superNamespace:' put: ns fullName ] ].
	blueprint behaviorType == #none ifFalse: [ properties at: 'type' put: blueprint behaviorType ].
	blueprint instanceVariables isEmpty ifFalse: [ properties at: 'instvars' put: blueprint instanceVariables ].
	blueprint classInstanceVariables isEmpty ifFalse: [ properties at: 'classinstvars' put: blueprint classInstanceVariables ].
	blueprint importsString isEmpty ifFalse: [ properties at: 'imports' put: (self encodeImportsString: blueprint) ].
	blueprint isPrivate ifTrue: [ properties at: 'private' put: blueprint isPrivate ].
	blueprint attributes isEmpty ifFalse: [ properties at: 'attributes' put: blueprint attributes ].
	self path: path tail: 'properties.json' write: [ :ws | properties jsonWriteOn: ws ]
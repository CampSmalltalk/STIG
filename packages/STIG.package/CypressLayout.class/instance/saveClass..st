saving
saveClass: blueprint

	| path name properties ns |
	name := blueprint reference name.
	path := (Array with: blueprint packageName, '.package' with: name, '.class').
	blueprint comment size = 0 ifFalse: [
		self path: path tail: CommentFile write: [ :ws | ws nextPutAll: blueprint comment] ].
	properties := Dictionary new.
	properties at: 'name' put: name.
	(IgnoredNamespaces includes: (ns := blueprint reference environment)) ifFalse: [
		properties at: 'namespace' put: ns fullName ].
	blueprint superclassReference ifNotNil: [
		properties at: 'super' put: blueprint superclassReference name.
		(IgnoredNamespaces includes: (ns := blueprint superclassReference environment)) ifFalse: [
			properties at: 'superNamespace:' put: ns fullName ] ].
	blueprint behaviorType == #none ifFalse: [ properties at: 'type' put: blueprint behaviorType ].
	blueprint instanceVariables isEmpty ifFalse: [ properties at: 'instvars' put: blueprint instanceVariables ].
	blueprint classInstanceVariables isEmpty ifFalse: [ properties at: 'classinstvars' put: blueprint classInstanceVariables ].
	blueprint importsString isEmpty ifFalse: [ properties at: 'imports' put: (self encodeImportsString: blueprint) ].
	blueprint isPrivate ifTrue: [ properties at: 'private' put: blueprint isPrivate ].
	blueprint attributes isEmpty ifFalse: [ properties at: 'attributes' put: blueprint attributes ].
	self path: path tail: PropertyFile write: [ :ws | properties jsonWriteOn: ws ]
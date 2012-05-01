saving
saveNamespace: aNamespaceBlueprint

	| path properties name ns |
	name := aNamespaceBlueprint reference name.
	path := Array with: aNamespaceBlueprint packageName, '.package' with: aNamespaceBlueprint reference name, '.pool'.
	aNamespaceBlueprint comment size = 0 ifFalse: [
		self path: path tail: self commentFile write: [ :ws | ws nextPutAll: aNamespaceBlueprint comment ] ].
	properties := Dictionary new.
	properties at: 'name' put: name.
	(IgnoredNamespaces includes: (ns := aNamespaceBlueprint reference environment)) ifFalse: [
		properties at: 'namespace' put: ns fullName ].
	aNamespaceBlueprint importsString isEmpty ifFalse: [ properties at: 'imports' put:  (self encodeImportsString: aNamespaceBlueprint) ].
	aNamespaceBlueprint isPrivate ifTrue: [ properties at: 'private' put: aNamespaceBlueprint isPrivate ].
	self path: path tail: self propertyFile write: [ :ws | properties jsonWriteOn: ws ]
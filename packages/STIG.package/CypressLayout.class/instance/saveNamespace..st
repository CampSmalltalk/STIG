saveNamespace: aNamespaceBlueprint

	| path properties |
	path := Array with: aNamespaceBlueprint packageName, '.package' with: aNamespaceBlueprint reference name, '.pool'.
	aNamespaceBlueprint comment size = 0 ifFalse: [
		self path: path tail: 'README' write: [ :ws | ws nextPutAll: aNamespaceBlueprint comment ] ].
	properties := Dictionary new.
	aNamespaceBlueprint importsString isEmpty ifFalse: [ properties at: 'imports' put:  (self encodeImportsString: aNamespaceBlueprint) ].
	aNamespaceBlueprint isPrivate ifTrue: [ properties at: 'private' put: aNamespaceBlueprint isPrivate ].
	self path: path tail: 'properties.json' write: [ :ws | properties jsonWriteOn: ws ]
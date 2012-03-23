saveClass: aClassBlueprint

	| path name properties |
	name := aClassBlueprint reference name.
	path := (Array with: aClassBlueprint packageName, '.package' with: name, '.class').
	aClassBlueprint comment size = 0 ifFalse: [
		self path: path tail: 'README' write: [ :ws |
			ws nextPutAll: 'comment:'.
			ws cr.
			ws nextPutAll: aClassBlueprint comment] ].
	properties := Dictionary new.
	aClassBlueprint superclassReference ifNotNil: [ properties at: 'super:' put: aClassBlueprint superclassReference ].
	aClassBlueprint behaviorType == #none ifFalse: [ properties at: 'type:' put: aClassBlueprint behaviorType ].
	aClassBlueprint instanceVariables isEmpty ifFalse: [ properties at: 'instvars:' put: aClassBlueprint instanceVariables ].
	aClassBlueprint classInstanceVariables isEmpty ifFalse: [ properties at: 'classinstvars:' put: aClassBlueprint classInstanceVariables ].
	aClassBlueprint importsString isEmpty ifFalse: [ properties at: 'imports:' put: (self encodeImportsString: aClassBlueprint) ].
	aClassBlueprint isPrivate ifTrue: [ properties at: 'private:' put: aClassBlueprint isPrivate ].
	aClassBlueprint attributes isEmpty ifFalse: [ properties at: 'attributes:' put: aClassBlueprint attributes ].
	self path: path tail: 'properties.json' writeJson: properties
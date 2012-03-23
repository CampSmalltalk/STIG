saveSharedVariable: aSharedVariableBlueprint

	| path properties |
	path := Array with: aSharedVariableBlueprint packageName with: aSharedVariableBlueprint reference environment name, '.pool'.
	properties := Dictionary new.
	properties at: #category put: aSharedVariableBlueprint category.
	aSharedVariableBlueprint isConstant ifTrue: [ properties at: 'constant:' put: aSharedVariableBlueprint isConstant ].
	aSharedVariableBlueprint isPrivate ifTrue: [ properties at: 'private:' put: aSharedVariableBlueprint isPrivate ].
	aSharedVariableBlueprint initializer ifNotNil: [ properties at: 'initializer' put: aSharedVariableBlueprint initializer].
	self path: path tail: aSharedVariableBlueprint reference name, '.json' writeJson: properties
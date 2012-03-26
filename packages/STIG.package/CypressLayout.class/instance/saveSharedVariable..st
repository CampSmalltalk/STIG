saveSharedVariable: aSharedVariableBlueprint

	| path properties namespace |
	namespace := aSharedVariableBlueprint reference environment.
	path := Array with: aSharedVariableBlueprint packageName, '.package'
			with: namespace name, (namespace isForClass ifTrue: [ '.class' ] ifFalse: [ '.pool' ]).
	properties := Dictionary new.
	properties at: #category put: aSharedVariableBlueprint category.
	aSharedVariableBlueprint isConstant ifTrue: [ properties at: 'constant' put: aSharedVariableBlueprint isConstant ].
	aSharedVariableBlueprint isPrivate ifTrue: [ properties at: 'private' put: aSharedVariableBlueprint isPrivate ].
	aSharedVariableBlueprint initializer ifNotNil: [ properties at: 'initializer' put: aSharedVariableBlueprint initializer].
	self path: path tail: aSharedVariableBlueprint reference name, '.json' write: [ :ws | properties jsonWriteOn: ws ]
saveSharedVariable: aSharedVariableBlueprint

	| path properties namespace reference |
	reference := aSharedVariableBlueprint reference.
	namespace := reference environment.
	path := Array with: aSharedVariableBlueprint packageName, '.package'
			with: namespace name, (namespace isForClass ifTrue: [ '.class' ] ifFalse: [ '.pool' ]).
	properties := Dictionary new.
	properties at: 'category' put: aSharedVariableBlueprint category.
	properties at: 'name' put: reference name.
	(IgnoredNamespaces includes: namespace) ifFalse: [ properties at: 'namespace' put: namespace fullName ].
	aSharedVariableBlueprint isConstant ifTrue: [ properties at: 'constant' put: aSharedVariableBlueprint isConstant ].
	aSharedVariableBlueprint isPrivate ifTrue: [ properties at: 'private' put: aSharedVariableBlueprint isPrivate ].
	aSharedVariableBlueprint initializer ifNotNil: [ properties at: 'initializer' put: aSharedVariableBlueprint initializer].
	self path: path tail: aSharedVariableBlueprint reference name, '.json' write: [ :ws | properties jsonWriteOn: ws ]
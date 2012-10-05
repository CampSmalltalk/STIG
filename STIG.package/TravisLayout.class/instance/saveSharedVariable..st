saving
saveSharedVariable: aSharedVariableBlueprint

	| path |
	path := (Array with: aSharedVariableBlueprint packageName)
				, (self shortReferencePath: aSharedVariableBlueprint reference).
	self
		path: path
		tail: '0.share'
		write: 
			[:ws |
			ws nextPutAll: aSharedVariableBlueprint category.
			ws cr.
			aSharedVariableBlueprint isConstant
				ifTrue: 
					[ws nextPutAll: 'constant:'.
					ws store: aSharedVariableBlueprint isConstant.
					ws cr].
			aSharedVariableBlueprint isPrivate
				ifTrue: 
					[ws nextPutAll: 'private:'.
					ws store: aSharedVariableBlueprint isPrivate.
					ws cr].
			aSharedVariableBlueprint initializer
				ifNotNil: 
					[ws nextPutAll: 'init:'.
					ws cr.
					ws nextPutAll: aSharedVariableBlueprint initializer]]
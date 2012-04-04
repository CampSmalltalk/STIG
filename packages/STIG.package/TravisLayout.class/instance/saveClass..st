saving
saveClass: aClassBlueprint

	| path |
	path := (Array with: aClassBlueprint packageName)
				, (self shortReferencePath: aClassBlueprint reference).
	self
		path: path
		tail: '0.class'
		write: 
			[:ws |
			aClassBlueprint superclassReference
				ifNotNil: 
					[ws nextPutAll: 'super:'.
					ws store: aClassBlueprint superclassReference.
					ws cr].
			aClassBlueprint behaviorType == #none
				ifFalse: 
					[ws nextPutAll: 'type:'.
					ws store: aClassBlueprint behaviorType.
					ws cr].
			aClassBlueprint instanceVariables isEmpty
				ifFalse: 
					[ws nextPutAll: 'instvars:'.
					ws store: aClassBlueprint instanceVariables.
					ws cr].
			aClassBlueprint classInstanceVariables isEmpty
				ifFalse: 
					[ws nextPutAll: 'classvars:'.
					ws store: aClassBlueprint classInstanceVariables.
					ws cr].
			aClassBlueprint importsString isEmpty
				ifFalse: 
					[ws nextPutAll: 'import:'.
					ws nextPutAll: (self encodeImportsString: aClassBlueprint).
					ws cr].
			aClassBlueprint isPrivate
				ifTrue: 
					[ws nextPutAll: 'private:'.
					ws store: aClassBlueprint isPrivate.
					ws cr].
			aClassBlueprint attributes isEmpty
				ifFalse: 
					[ws nextPutAll: 'attributes:'.
					ws store: aClassBlueprint attributes.
					ws cr].
			aClassBlueprint comment size = 0
				ifFalse: 
					[ws nextPutAll: 'comment:'.
					ws cr.
					ws nextPutAll: aClassBlueprint comment]]
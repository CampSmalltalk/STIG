saveNamespace: aNamespaceBlueprint

	| path |
	path := (Array with: aNamespaceBlueprint packageName)
				, (self shortReferencePath: aNamespaceBlueprint reference).
	self
		path: path
		tail: '0.namespace'
		write: 
			[:ws |
			aNamespaceBlueprint importsString isEmpty
				ifFalse: 
					[ws nextPutAll: 'import:'.
					ws nextPutAll: (self encodeImportsString: aNamespaceBlueprint).
					ws cr].
			aNamespaceBlueprint isPrivate
				ifTrue: 
					[ws nextPutAll: 'private:'.
					ws store: aNamespaceBlueprint isPrivate.
					ws cr].
			aNamespaceBlueprint comment size = 0
				ifFalse: 
					[ws nextPutAll: 'comment:'.
					ws cr.
					ws nextPutAll: aNamespaceBlueprint comment]]
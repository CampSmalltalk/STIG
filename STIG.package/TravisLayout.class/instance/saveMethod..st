saving
saveMethod: aMethodBlueprint

	| path tail |
	path := (Array with: aMethodBlueprint packageName)
				, (self shortReferencePath: aMethodBlueprint classReference).
	tail := (aMethodBlueprint isInstanceBehavior ifTrue: [''] ifFalse: ['^'])
				, (self encodeSelector: aMethodBlueprint selector).
	self
		path: path
		tail: tail
		write: 
			[:ws |
			ws
				nextPutAll: aMethodBlueprint category;
				cr;
				nextPutAll: aMethodBlueprint source]
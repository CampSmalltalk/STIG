saveMethod: aMethodBlueprint

	| path tail properties |
	path := (Array with: aMethodBlueprint packageName, '.package' with: aMethodBlueprint classReference name, '.class'
			with: (aMethodBlueprint isInstanceBehavior ifTrue: ['instance'] ifFalse: ['class'])).
	tail := self encodeSelector: aMethodBlueprint selector.
	properties := Dictionary new at: #category put: aMethodBlueprint category; yourself.
	self path: path tail: tail, '.json' writeJson: properties.
	self path: path tail: tail, '.st' write: [:ws | ws nextPutAll: aMethodBlueprint source]
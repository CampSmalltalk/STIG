saveProperty: aPropertyBlueprint

	| path |
	aPropertyBlueprint key = #comment ifFalse: [^self].
	path := Array with: aPropertyBlueprint codeComponentName.
	self
		path: path
		tail: 'README'
		write: [:ws | ws nextPutAll: aPropertyBlueprint value]
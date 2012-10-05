saving
saveProperty: aPropertyBlueprint

	| path |
	path := Array with: aPropertyBlueprint codeComponentName
				with: '_.Properties'.
	self
		path: path
		tail: aPropertyBlueprint key
		write: [:ws | ws store: aPropertyBlueprint value]
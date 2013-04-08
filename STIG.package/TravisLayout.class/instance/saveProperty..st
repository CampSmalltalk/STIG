"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: saving
"
saveProperty: aPropertyBlueprint

	| path |
	path := Array with: aPropertyBlueprint codeComponentName
				with: '_.Properties'.
	self
		path: path
		tail: aPropertyBlueprint key
		write: [:ws | ws store: aPropertyBlueprint value]
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: saving
"
saveProperty: aPropertyBlueprint

	| path |
	aPropertyBlueprint key = #comment ifFalse: [^self].
	path := Array with: aPropertyBlueprint codeComponentName.
	self
		path: path
		tail: self commentFile
		write: [:ws | ws nextPutAll: aPropertyBlueprint value]
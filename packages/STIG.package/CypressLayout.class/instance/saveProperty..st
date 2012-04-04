saving
saveProperty: aPropertyBlueprint

	| path |
	aPropertyBlueprint key = #comment ifFalse: [^self].
	path := Array with: aPropertyBlueprint codeComponentName.
	self
		path: path
		tail: CommentFile
		write: [:ws | ws nextPutAll: aPropertyBlueprint value]
readNamespace: aFilename using: fromDisk

	| rs lookup dispatch blueprint |
	blueprint := NamespaceBlueprint new.
	blueprint original: aFilename.
	blueprint reference: fromDisk reference.
	blueprint importsString: ''.
	blueprint isPrivate: false.
	blueprint comment: ''.
	rs := (fromDisk fileContents: aFilename) readStream.
	lookup := #('import:' 'private:').
	dispatch := #(#load:importsString: #load:isPrivate:).
	[rs atEnd] whileFalse: 
			[| line |
			line := rs upTo: Character cr.
			line = 'comment:'
				ifTrue: [blueprint comment: rs upToEnd]
				ifFalse: 
					[| index |
					index := lookup findFirst: [:each | line beginsWith: each].
					fromDisk
						perform: (dispatch at: index)
						with: blueprint
						with: (line allButFirst: (lookup at: index) size)]].
	fromDisk addBlueprint: blueprint.
	^fromDisk
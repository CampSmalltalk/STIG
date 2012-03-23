readClass: aFilename using: fromDisk

	| rs lookup dispatch blueprint |
	blueprint := ClassBlueprint new.
	blueprint original: aFilename.
	blueprint reference: fromDisk reference.
	blueprint importsString: ''.
	blueprint isPrivate: false.
	blueprint instanceVariables: Array new.
	blueprint classInstanceVariables: Array new.
	blueprint attributes: Array new.
	blueprint behaviorType: #none.
	blueprint comment: ''.
	rs := (fromDisk fileContents: aFilename) readStream.
	lookup := #('super:' 'instvars:' 'import:' 'type:' 'classvars:' 'private:' 'attributes:').
	dispatch := #(#load:superclassReference: #load:instanceVariables: #load:importsString: #load:behaviorType: #load:classInstanceVariables: #load:isPrivate: #load:attributes:).
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
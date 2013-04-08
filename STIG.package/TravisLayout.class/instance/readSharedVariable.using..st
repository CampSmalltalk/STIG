"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readSharedVariable: aFilename using: fromDisk

	| rs lookup dispatch blueprint |
	blueprint := SharedVariableBlueprint new.
	blueprint original: aFilename.
	blueprint reference: fromDisk reference.
	rs := (fromDisk fileContents: aFilename) readStream.
	blueprint category: (rs upTo: Character cr).
	blueprint isPrivate: false.
	blueprint isConstant: false.
	lookup := #('private:' 'constant:').
	dispatch := #(#load:isPrivate: #load:isConstant:).
	[rs atEnd] whileFalse: 
			[| line |
			line := rs upTo: Character cr.
			line = 'init:'
				ifTrue: [blueprint initializer: rs upToEnd]
				ifFalse: 
					[| index |
					index := lookup findFirst: [:each | line beginsWith: each].
					fromDisk
						perform: (dispatch at: index)
						with: blueprint
						with: (line allButFirst: (lookup at: index) size)]].
	fromDisk addBlueprint: blueprint.
	^fromDisk
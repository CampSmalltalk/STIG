"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: STIG
"
stigCopyright

	^self copyrightNotice
		ifNil: [ '' ]
		ifNotNil: [ :notice || stream line |
			stream := notice readStream.
			[ stream atEnd or: [ (line := stream upTo: Character cr) beginsWith: 'Copyright' ] ] whileFalse.
			(line beginsWith: 'Copyright') ifTrue: [ line ] ifFalse: [ '' ] ]
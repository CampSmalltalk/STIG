printing
jsonWriteOn: stream tabs: tabs

	| keys |
	stream nextPut: ${.
	keys := self class instVarNames.
	keys isEmpty ifTrue: [ stream nextPut: $}. ^self ].
	keys do: [ :var | stream nextPut: $"; nextPutAll: var; nextPutAll: '" : '.
			(self instVarAt: var) jsonWriteOn: stream tabs: tabs + 1 ]
		separatedBy: [ stream nextPut: $,; cr.
			tabs + 1 timesRepeat: [ stream tab ] ].
	stream nextPutAll: ' }'
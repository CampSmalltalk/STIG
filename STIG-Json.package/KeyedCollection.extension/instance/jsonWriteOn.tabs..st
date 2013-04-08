"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: printing
"
jsonWriteOn: stream tabs: tabs

	stream nextPut: ${; tab.  
	self isEmpty ifTrue: [ stream nextPut: $}. ^self ].
	self keys sorted
		do: [ :key | stream nextPut: $"; nextPutAll: key; nextPutAll: '" : '.
			(self at: key) jsonWriteOn: stream tabs: tabs + 1 ]
		separatedBy: [ stream nextPut: $,; cr.
			tabs + 1 timesRepeat: [ stream tab ] ].
	stream nextPutAll: ' }'
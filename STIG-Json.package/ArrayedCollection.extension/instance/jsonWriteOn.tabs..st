"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: printing
"
jsonWriteOn: stream tabs: tabs

	stream nextPut: $[; tab.  
	self isEmpty ifTrue: [ stream nextPut: $]. ^self ].
	(1 to: self size)
		do: [ :i | (self at: i) jsonWriteOn: stream tabs: tabs + 1 ]
		separatedBy: [ stream nextPut: $,; cr.
			tabs + 1 timesRepeat: [ stream tab ] ].
	stream nextPutAll: ' ]'
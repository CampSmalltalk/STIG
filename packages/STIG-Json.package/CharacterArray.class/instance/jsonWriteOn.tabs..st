jsonWriteOn: stream tabs: tabs

	stream nextPut: $".
	self do: [ :c |
		c codePoint < 128
			ifTrue: [ ('"\' includes: c) ifTrue: [ stream nextPut: $\ ].
					stream nextPut: c ]
			ifFalse: [ stream nextPutAll: '\u'.
				c codePoint printOn: stream base: 16 digitsToPad: 4 highDigit: 4 ] ].
	stream nextPut: $"
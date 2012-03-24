parseArray

	| array c |
	self get = $[ ifFalse: [ self error: 'Failed parsing array' ].
	array := Array new writeStream.
	[	array nextPut: (self skipWhitespace; parse).
		(c := self skipWhitespace; get) = $,
	] whileTrue.
	c = $] ifFalse: [ self error: 'Failed parsing array' ].
	^array contents
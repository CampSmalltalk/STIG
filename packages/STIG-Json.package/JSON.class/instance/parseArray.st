parseArray

	| array |
	self get = $[ ifFalse: [ self error: 'Failed parsing array' ].
	array := Array new writeStream.
	self skipWhitespace.
	[	self peek = $]
	] whileFalse: [
		array nextPut: self parse.
		(self skipWhitespace; peek) = $, ifTrue: [
			self get; skipWhitespace ] ].
	self get.
	^array contents
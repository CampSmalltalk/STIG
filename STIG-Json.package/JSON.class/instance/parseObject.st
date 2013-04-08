"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-parsing
"
parseObject

	| object |
	self get = ${ ifFalse: [ self error: 'Failed parsing object' ].
	object := Dictionary new.
	self skipWhitespace.
	[	self peek = $}
	] whileFalse: [ | key value |
		key := self parseString.
		(self skipWhitespace; get) = $: ifFalse: [ self error: 'Failed parsing object' ].
		value := self skipWhitespace; parse.
		object at: key put: value.
		(self skipWhitespace; peek) = $, ifTrue: [
			self get; skipWhitespace ] ].
	self get.
	^object
parseObject

	| object c |
	self get = ${ ifFalse: [ self error: 'Failed parsing object' ].
	object := Dictionary new.
	[	| key value |
		key := self skipWhitespace; parseString.
		(self skipWhitespace; get) = $: ifFalse: [ self error: 'Failed parsing object' ].
		value := self skipWhitespace; parse.
		object at: key put: value.
		(c := self skipWhitespace; get) = $,
	] whileTrue.
	c = $} ifFalse: [ self error: 'Failed parsing object' ].
	^object
private-parsing
parseFalse

	(self read: 5) = 'false' ifTrue: [^false].
	self error: 'Failed parsing false'
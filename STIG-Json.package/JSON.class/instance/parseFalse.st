"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-parsing
"
parseFalse

	(self read: 5) = 'false' ifTrue: [^false].
	self error: 'Failed parsing false'
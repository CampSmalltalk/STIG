"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-parsing
"
parseNull

	(self read: 4) = 'null' ifTrue: [^nil].
	self error: 'Failed parsing null'
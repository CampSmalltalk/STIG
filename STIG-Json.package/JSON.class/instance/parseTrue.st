"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-parsing
"
parseTrue

	(self read: 4) = 'true' ifTrue: [^true].
	self error: 'Failed parsing true'
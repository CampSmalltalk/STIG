private-parsing
parseTrue

	(self read: 4) = 'true' ifTrue: [^true].
	self error: 'Failed parsing true'
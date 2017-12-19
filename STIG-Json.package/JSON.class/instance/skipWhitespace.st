"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
skipWhitespace
	| c |
	[ (c := self get) isSeparator ] whileTrue.
	char := c
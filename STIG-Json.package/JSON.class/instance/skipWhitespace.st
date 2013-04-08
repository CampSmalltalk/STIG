"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
skipWhitespace

	| c |
	[ Whitespace includes: (c := self get) ] whileTrue.
	char := c
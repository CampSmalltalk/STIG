private
skipWhitespace

	| c |
	[ Whitespace includes: (c := self get) ] whileTrue.
	char := c
parseUnicodeCodePoint: digits

	| hex codePoint |
	hex := '0123456789abcdef'.
	codePoint := digits inject: 0 into: [ :nr :c | nr * 16 + (hex indexOf: c) - 1 ].
	^codePoint asCharacter
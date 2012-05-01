private-parsing
parseNumber
	
	| number digit |
	number := String new writeStream.
	[ (digit := self get) isDigit ] whileTrue: [ number nextPut: digit ].
	char := digit.
	^Number readFrom: number contents readStream
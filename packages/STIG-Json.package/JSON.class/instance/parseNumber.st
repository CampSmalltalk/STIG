parseNumber
	
	| number |
	number := String new writeStream.
	[ (char := self get) isDigit ] whileTrue: [ number nextPut: char ].
	^Number readFrom: number contents readStream
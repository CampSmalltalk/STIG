parseString
	
	| string c |
	string := String new writeStream.
	self get = $" ifFalse: [ self error: 'Failed parsing String' ].
	[ (c := self get) = $" ] whileFalse: [
		c = $\ ifTrue: [ c := self parseSpecialCharacter ].
		string nextPut: c ].
	^string contents
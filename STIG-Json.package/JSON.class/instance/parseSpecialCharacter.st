"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-parsing
"
parseSpecialCharacter

	| c |
	c := self get.
	c = $\  ifTrue: [ ^$\ ].
	c = $" ifTrue: [ ^$" ].
	c = $n ifTrue: [ ^Character cr ].
	c = $t ifTrue: [ ^Character tab ].
	c = $u ifTrue: [ ^self parseUnicodeCodePoint: (self read: 4) asLowercase ].
	self error: 'Failed parsing special character'
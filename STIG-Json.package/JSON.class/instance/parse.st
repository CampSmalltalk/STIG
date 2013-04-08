"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-parsing
"
parse

	self skipWhitespace.
	char := self peek.
	char = ${ ifTrue: [ ^self parseObject ].
	char = $[ ifTrue: [ ^self parseArray ].
	char = $" ifTrue: [ ^self parseString ].
	char = $n ifTrue: [ ^self parseNull ].
	char = $t ifTrue: [ ^self parseTrue ].
	char = $f ifTrue: [ ^self parseFalse ].
	char isDigit ifTrue: [ ^self parseNumber ].
	self error: 'Invalid JSON'
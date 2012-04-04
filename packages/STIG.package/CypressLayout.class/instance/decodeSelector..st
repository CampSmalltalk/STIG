private
decodeSelector: aString

	| specials ws rs |
	aString last = $. ifTrue: [^aString replaceAll: $. with: $:; yourself].
	aString first isAlphabetic ifTrue: [^aString].
	specials := self class specials.
	ws := String new writeStream.
	rs := aString readStream.
	rs next "skip the carret".
	[ rs atEnd ] whileFalse: [
		ws nextPut: (specials at: (rs upTo: $.)) ].
	^ws contents
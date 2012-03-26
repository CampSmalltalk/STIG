get

	^char ifNil: [ stream next ]
		ifNotNil: [ :c | char := nil. c ]
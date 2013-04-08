"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
translateMultiByteUTF8: aByteArray

	| output index size firstByte |
	output := String new writeStream.
	index := 1.
	size := aByteArray size.
	[index <= size] whileTrue: 
			[firstByte := aByteArray at: index.
			firstByte < 2r10000000
				ifTrue: 
					[output
						nextPut: (firstByte = 10
								ifTrue: [13]
								ifFalse: [firstByte = 13 ifTrue: [10] ifFalse: [firstByte]]) asCharacter.
					index := index + 1]
				ifFalse: 
					[firstByte < 2r11000000
						ifTrue: 
							[output
								nextPut: ((firstByte bitAnd: 2r00011111) * 64
										+ ((aByteArray at: index + 1) bitAnd: 2r00111111)) asCharacter.
							index := index + 2]
						ifFalse: 
							[firstByte < 2r11100000
								ifTrue: 
									[output
										nextPut: (((firstByte bitAnd: 2r00001111) * 64
												+ ((aByteArray at: index + 1) bitAnd: 2r00111111)) * 64
												+ ((aByteArray at: index + 2) bitAnd: 2r00111111)) asCharacter.
									index := index + 3]
								ifFalse: 
									[output
										nextPut: ((((firstByte bitAnd: 2r00000111) * 64
												+ ((aByteArray at: index + 1) bitAnd: 2r00111111)) * 64
												+ ((aByteArray at: index + 2) bitAnd: 2r00111111)) * 64
												+ ((aByteArray at: index + 3) bitAnd: 2r00111111)) asCharacter.
									index := index + 3]]]].
	^output contents
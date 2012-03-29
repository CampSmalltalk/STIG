emitUTF8Into: aByteArray startingAt: anIndex

	| code |
	code := self codePoint.
	^code < 16r80
		ifTrue: 
			[aByteArray at: anIndex
				put: (code = 13
						ifTrue: [10]
						ifFalse: [code = 10 ifTrue: [13] ifFalse: [code]]).
			1]
		ifFalse: 
			[code < 16r800
				ifTrue: 
					[aByteArray at: anIndex put: (code bitShift: -6) + 16rC0.
					aByteArray at: anIndex + 1 put: (code bitAnd: 16r3F) + 16r80.
					2]
				ifFalse: 
					[code < 16r10000
						ifTrue: 
							[aByteArray at: anIndex put: (code bitShift: -12) + 16rE0.
							aByteArray at: anIndex + 1
								put: ((code bitShift: -6) bitAnd: 16r3F) + 16r80.
							aByteArray at: anIndex + 2 put: (code bitAnd: 16r3F) + 16r80.
							3]
						ifFalse: 
							[aByteArray at: anIndex put: (code bitShift: -18) + 16rF0.
							aByteArray at: anIndex + 1
								put: ((code bitShift: -12) bitAnd: 16r3F) + 16r80.
							aByteArray at: anIndex + 2
								put: ((code bitShift: -6) bitAnd: 16r3F) + 16r80.
							aByteArray at: anIndex + 3 put: (code bitAnd: 16r3F) + 16r80.
							4]]]
private
decodeSelector: aString

	^aString last = $.
		ifTrue: [aString collect: [:each | each = $. ifTrue: [$:] ifFalse: [each]]]
		ifFalse: 
			[aString first isAlphabetic
				ifTrue: [aString]
				ifFalse: 
					[String withAll: ((aString runsSatisfying: #isDigit)
								collect: [:each | Character codePoint: each asNumber])]]
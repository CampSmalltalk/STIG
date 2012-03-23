encodeSelector: aSymbol

	^aSymbol last = $:
		ifTrue: [aSymbol collect: [:each | each = $: ifTrue: [$.] ifFalse: [each]]]
		ifFalse: 
			[aSymbol first isAlphabetic
				ifTrue: [aSymbol]
				ifFalse: 
					[| output specials |
					specials := self class specials.
					output := String new writeStream.
					output nextPut: $^.
					aSymbol do: [:each | output nextPutAll: (specials at: each) ]
						separatedBy: [output nextPut: $.].
					output contents]]
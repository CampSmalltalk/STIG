encodeSelector: aSymbol

	^aSymbol last = $:
		ifTrue: [aSymbol collect: [:each | each = $: ifTrue: [$-] ifFalse: [each]]]
		ifFalse: 
			[aSymbol first isAlphabetic
				ifTrue: [aSymbol]
				ifFalse: 
					[| output |
					output := String new writeStream.
					aSymbol do: [:each | each codePoint printOn: output]
						separatedBy: [output nextPut: $_].
					output contents]]
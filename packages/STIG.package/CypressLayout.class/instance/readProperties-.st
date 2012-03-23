readProperties: properties

	properties directoryContentsDo: 
			[:eachFile :eachTail |
			eachFile isDirectory
				ifFalse: [| blueprint |
					blueprint := CodeComponentPropertyBlueprint new.
					blueprint key: eachTail asSymbol.
					blueprint original: eachFile.
					blueprint value: (Compiler evaluate: (properties fileContents: eachFile)).
					properties addBlueprint: blueprint]].
	^properties
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readPackage: aPackage

	aPackage directoryContentsDo: 
			[:eachFile :eachTail |
			'.git' = eachTail
				ifFalse: 
					[eachFile isDirectory
						ifTrue: 
							[| type |
							type := '_.Properties' = eachTail
										ifTrue: [PropertiesFromDisk]
										ifFalse: [BoundVariableFromDisk].
							(type parent: aPackage directory: eachFile name: eachTail) read: self ]]].
	^aPackage
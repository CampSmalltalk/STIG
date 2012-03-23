readPackage: package

	package directoryContentsDo: 
			[:eachFile :eachTail |
			'.git' = eachTail
				ifFalse: 
					[eachFile isDirectory
						ifTrue: 
							[| type |
							type := '_.Properties' = eachTail
										ifTrue: [PropertiesFromDisk]
										ifFalse: [BoundVariableFromDisk].
							(type parent: package directory: eachFile name: eachTail) read: self ]]].
	^package
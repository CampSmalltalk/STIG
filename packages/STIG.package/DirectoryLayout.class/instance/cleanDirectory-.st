cleanDirectory: aDirectory

	| fileList allRemoved |
	fileList := aDirectory directoryContents.
	allRemoved := true.
	fileList do: 
			[:each |
			| filename |
			filename := aDirectory trustedConstruct: each.
			filename isDirectory
				ifTrue: 
					[each = '.git'
						ifTrue: [allRemoved := false]
						ifFalse: [allRemoved := allRemoved & (self cleanDirectory: filename)]]
				ifFalse: [allRemoved := false]].
	allRemoved ifTrue: [aDirectory delete].
	^allRemoved
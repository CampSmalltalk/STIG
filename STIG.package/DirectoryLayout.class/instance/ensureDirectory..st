"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-writing
"
ensureDirectory: aDirectorySequence

	^directoryCache at: aDirectorySequence
		ifAbsentPut: 
			[| actualFilename |
			actualFilename := root asFilename.
			aDirectorySequence
				do: [:each | actualFilename := actualFilename trustedConstruct: (self sanitize: each)].
			actualFilename ensureDirectory.
			actualFilename]
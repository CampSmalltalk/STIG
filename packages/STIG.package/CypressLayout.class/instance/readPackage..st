readPackage: package

	package directoryContentsDo: [:eachFile :eachTail |
		eachFile isDirectory ifTrue: [
			(BoundVariableFromDisk parent: package directory: eachFile name: eachTail) read: self ]].
	^package
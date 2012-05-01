loading
readPackage: package

	package directoryContentsDo: [:eachFile :eachTail |
		eachFile isDirectory
			ifTrue: [ (BoundVariableFromDisk parent: package directory: eachFile name: eachTail) read: self ]
			ifFalse: [
				eachTail = self commentFile ifTrue: [ self readComment: eachFile using: package ].
				eachTail = self propertyFile ifTrue: [ self readProperties: eachFile using: package ] ] ].
	^package
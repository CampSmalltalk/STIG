loading
readPackage: package

	package directoryContentsDo: [:eachFile :eachTail |
		eachFile isDirectory
			ifTrue: [ (BoundVariableFromDisk parent: package directory: eachFile name: eachTail) read: self ]
			ifFalse: [
				eachTail = CommentFile ifTrue: [ self readComment: eachFile using: package ].
				eachTail = PropertyFile ifTrue: [ self readProperties: eachFile using: package ] ] ].
	^package
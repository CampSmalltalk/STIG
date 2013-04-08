"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readPackage: aPackage

	aPackage directoryContentsDo: [:eachFile :eachTail |
		eachFile isDirectory
			ifTrue: [ (BoundVariableFromDisk parent: aPackage directory: eachFile name: eachTail) read: self ]
			ifFalse: [
				eachTail = self commentFile ifTrue: [ self readComment: eachFile using: aPackage ].
				eachTail = self propertyFile ifTrue: [ self readProperties: eachFile using: aPackage ] ] ].
	^aPackage
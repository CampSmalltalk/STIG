readPackage: package

	package directoryContentsDo: [:eachFile :eachTail |
		eachFile isDirectory
			ifTrue: [(BoundVariableFromDisk parent: package directory: eachFile name: eachTail) read: self ]
			ifFalse: [
				eachFile = CommentFile ifTrue: [| blueprint |
						blueprint := CodeComponentPropertyBlueprint new.
						blueprint key: #comment;
							value: (package fileContents: eachFile / CommentFile);
							original: eachFile.
						package addBlueprint: blueprint].
				eachFile = PropertyFile ifTrue: [ | properties |
					properties := JSON read: (package fileContents: eachFile / PropertyFile) readStream.
					properties keysAndValuesDo: [ :key :value || blueprint |
						blueprint := CodeComponentPropertyBlueprint new.
						blueprint key: key asSymbol; value: value.
						blueprint original: eachFile.
						package addBlueprint: blueprint]]]].
	^package
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readBoundVariable: variable

	variable directoryContentsDo: 
			[:eachFile :eachTail |
			eachFile isDirectory
				ifTrue: 
					[(BoundVariableFromDisk parent: variable directory: eachFile name: eachTail)
						read: self ]
				ifFalse: [self readFile: eachFile tail: eachTail using: variable]].
	^variable
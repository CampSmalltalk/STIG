"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readBoundVariable: variable

	variable directoryContentsDo: [:eachFile :eachTail |
		(eachFile isDirectory or: [ eachTail = self commentFile or: [ eachTail = self licenseFile] ]) ifFalse: [
			eachTail = self propertyFile
				ifTrue: [ (variable name endsWith: '.pool')
						ifTrue: [self readNamespace: eachFile using: variable]
						ifFalse: [self readClass: eachFile using: variable ] ]
				ifFalse: [ self readSharedVariable: eachFile using: variable ] ] ].
	variable directory: 'class' contentsDo: [ :file :tail |
		file extension = '.st' ifTrue: [ self readMethod: file tail: tail instance: false using: variable ] ].
	variable directory: 'instance' contentsDo: [ :file :tail |
		file extension = '.st' ifTrue: [ self readMethod: file tail: tail instance: true using: variable ] ].
	^variable
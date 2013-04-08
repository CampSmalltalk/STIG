"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readFile: aFilename tail: aTail using: fromDisk

	^aTail first = $0
		ifTrue: [self readDefinition: aFilename tail: aTail using: fromDisk]
		ifFalse: [self readMethod: aFilename tail: aTail using: fromDisk]
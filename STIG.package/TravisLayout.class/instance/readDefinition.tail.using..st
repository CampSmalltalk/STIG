"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: loading
"
readDefinition: aFilename tail: aTail using: fromDisk

	'0.class' = aTail
		ifTrue: [self readClass: aFilename using: fromDisk]
		ifFalse: 
			['0.share' = aTail
				ifTrue: [self readSharedVariable: aFilename using: fromDisk]
				ifFalse: 
					['0.namespace' = aTail
						ifTrue: [self readNamespace: aFilename using: fromDisk]
						ifFalse: [self unreachableCode]]].
	^fromDisk
directory: tail contentsDo: aBlock

	| dir |
	(dir := directory / tail) exists ifTrue: [
		dir directoryContents do: [:each |
			aBlock value: (dir trustedConstruct: each) value: each] ]
directory: tail contentsDo: aBlock

	| dir |
	(dir := directory / tail) exists ifFalse: [^self].
	dir directoryContents
		do: [:each | aBlock value: (dir trustedConstruct: each) value: each]
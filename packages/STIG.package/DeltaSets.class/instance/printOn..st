printing
printOn: aStream

	aStream nextPutAll: 'ADDITIONS ('; print: additions size; nextPut: $).
	additions do: [:each | aStream cr; print: each ].
	aStream cr; cr; nextPutAll: 'CHANGES ('; print: changes size; nextPut: $).
	changes with: originals
		do: [:eachChange :eachOriginal | aStream cr; print: eachChange ].
	aStream cr; cr; nextPutAll: 'REMOVALS ('; print: removals size; nextPut: $).
	removals reverseDo: [:each | aStream cr; print: each ]
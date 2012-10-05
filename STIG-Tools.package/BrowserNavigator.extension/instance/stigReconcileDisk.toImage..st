STIG
stigReconcileDisk: diskBlueprints toImage: imageBlueprints

	| diffs diskStack imageStack toRemove toUpdate againDisk againImage |
	diskBlueprints sort.
	imageBlueprints sort.
	diffs := (SequenceableCollectionDifferences new)
				comparisonFunction: [:a :b | a refersToSameObject: b];
				differencesFrom: diskBlueprints to: imageBlueprints.
	diskStack := OrderedCollection withAll: diskBlueprints.
	imageStack := OrderedCollection withAll: imageBlueprints.
	toRemove := OrderedCollection new.
	toUpdate := OrderedCollection new.
	againDisk := OrderedCollection new.
	againImage := OrderedCollection new.
	diffs do: 
			[:eachSubsequence |
			eachSubsequence isDelete
				ifTrue: [toRemove addAll: (diskStack removeFirst: eachSubsequence length)]
				ifFalse: 
					[eachSubsequence isInsert
						ifTrue: [toUpdate addAll: (imageStack removeFirst: eachSubsequence length)]
						ifFalse: 
							[againImage addAll: (imageStack removeFirst: eachSubsequence length).
							againDisk addAll: (diskStack removeFirst: eachSubsequence length)]]].
	diffs := againDisk differences: againImage.
	(diffs select: #isInsert)
		do: [:eachSubsequence | toUpdate addAll: eachSubsequence].
	toRemove do: [:each | each original delete].
	^toUpdate
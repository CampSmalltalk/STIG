"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
compareFromBlueprints: fromBlueprints toBlueprints: toBlueprints

	| diffs toStack fromStack localRemoved localChanged localAdded fromAgain toAgain localOriginals |
	toBlueprints sort.
	fromBlueprints sort.
	diffs := (SequenceableCollectionDifferences new)
				comparisonFunction: [:a :b | a refersToSameObject: b];
				differencesFrom: fromBlueprints to: toBlueprints.
	fromStack := OrderedCollection withAll: fromBlueprints.
	toStack := OrderedCollection withAll: toBlueprints.
	localRemoved := OrderedCollection new.
	localChanged := OrderedCollection new.
	localAdded := OrderedCollection new.
	localOriginals := OrderedCollection new.
	fromAgain := OrderedCollection new.
	toAgain := OrderedCollection new.
	diffs do: 
			[:eachSubsequence |
			eachSubsequence isDelete
				ifTrue: [localRemoved addAll: (fromStack removeFirst: eachSubsequence length)]
				ifFalse: 
					[eachSubsequence isInsert
						ifTrue: [localAdded addAll: (toStack removeFirst: eachSubsequence length)]
						ifFalse: 
							[toAgain addAll: (toStack removeFirst: eachSubsequence length).
							fromAgain addAll: (fromStack removeFirst: eachSubsequence length)]]].
	(fromAgain differences: toAgain) do: 
			[:each |
			each isInsert
				ifTrue: [localChanged addAll: each]
				ifFalse: [each isDelete ifTrue: [localOriginals addAll: each]]].
	self addBlueprints: localRemoved to: removals.
	self addBlueprints: localAdded to: additions.
	self addBlueprints: localOriginals to: originals.
	self addBlueprints: localChanged to: changes
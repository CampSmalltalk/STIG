"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: utility
"
sortForDoingImageUpdates: aCollection

	| result byNeed notYetAdded canBeAdded groupToAdd |
	result := OrderedCollection new.
	byNeed := aCollection groupedBy: #neededReference.
	notYetAdded := (aCollection collect: #reference) asSet.
	[byNeed isEmpty] whileFalse: 
			[canBeAdded := byNeed keys
						reject: [:eachNeededReference | notYetAdded includes: eachNeededReference].
			canBeAdded do: 
					[:eachKey |
					groupToAdd := byNeed removeKey: eachKey.
					groupToAdd do: [:each | notYetAdded remove: each reference].
					result addAll: groupToAdd]].
	^result
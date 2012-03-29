saveDeltas: deltas directory: fromDisk

	deltas hasPackagePropertyChanges ifTrue: [ self savePackage: fromDisk ].
	definedClasses := deltas toClasses collect: [ :each | each reference ].
	classPaths := Dictionary new.
	self saveAll: deltas additions.
	self saveAll: deltas changes.
	deltas removals do: [:each | each original delete].
	self cleanDirectory: fromDisk directory
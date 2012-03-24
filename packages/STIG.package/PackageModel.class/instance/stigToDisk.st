stigToDisk

	| fromDisk deltas layout |
	layout := DirectoryLayout root: self stigRoot.
	fromDisk := layout packageFromDisk: self name.
	fromDisk directory ensureDirectory.
	fromDisk read: layout.
	deltas := DeltaSets from: fromDisk to: self.
	deltas hasPackagePropertyChanges ifTrue: [ layout savePackage: self ].
	layout
		saveAll: deltas additions;
		saveAll: deltas changes.
	deltas removals do: [:each | each original delete].
	layout cleanDirectory: fromDisk directory
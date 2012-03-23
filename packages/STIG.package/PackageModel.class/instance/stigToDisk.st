stigToDisk

	| fromDisk deltas toDisk |
	fromDisk := PackageFromDisk forPackage: self.
	fromDisk directory ensureDirectory.
	"eventually get the layout from the disk if it's there"
	toDisk := DefaultLayout root: self stigRoot.
	fromDisk read: toDisk.
	deltas := DeltaSets from: fromDisk to: self.
	deltas hasPackagePropertyChanges ifTrue: [ toDisk savePackage: self ].
	toDisk
		saveAll: deltas additions;
		saveAll: deltas changes.
	deltas removals do: [:each | each original delete].
	toDisk cleanDirectory: fromDisk directory
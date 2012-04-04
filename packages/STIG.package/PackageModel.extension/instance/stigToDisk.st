STIG
stigToDisk

	| fromDisk deltas layout |
	layout := DirectoryLayout root: self stigRoot.
	fromDisk := layout packageFromDisk: self name.
	fromDisk directory ensureDirectory.
	fromDisk read: layout.
	deltas := DeltaSets from: fromDisk to: self.
	layout saveDeltas: deltas directory: fromDisk
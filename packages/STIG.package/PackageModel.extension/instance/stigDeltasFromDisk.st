stigDeltasFromDisk

	| layout fromDisk |
	layout := DirectoryLayout root: self stigRoot.
	fromDisk := ((layout packageFromDisk: self name) read: layout).
	^DeltaSets from: self to: fromDisk
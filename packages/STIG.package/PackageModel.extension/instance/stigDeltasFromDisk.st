STIG
stigDeltasFromDisk

	| layout fromDisk |
	layout := DirectoryLayout root: self stigRoot.
	fromDisk := ((layout packageFromDisk: self name) read: layout).
	^layout deltaSetsFrom: self to: fromDisk
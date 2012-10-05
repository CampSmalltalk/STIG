STIG
stigFromDisk: aFromDisk

	| deltas layout |
	layout := DirectoryLayout root: self stigRoot.
	deltas := layout deltaSetsFrom: self to: aFromDisk.
	deltas buildCompositeChange execute
stigFromDisk: aFromDisk

	| deltas |
	deltas := DeltaSets from: self to: aFromDisk.
	deltas buildCompositeChange execute
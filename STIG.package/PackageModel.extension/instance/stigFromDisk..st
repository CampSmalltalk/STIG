"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: STIG
"
stigFromDisk: aFromDisk

	| deltas layout |
	layout := DirectoryLayout for: self.
	deltas := layout deltaSetsFrom: self to: aFromDisk.
	deltas buildCompositeChange execute
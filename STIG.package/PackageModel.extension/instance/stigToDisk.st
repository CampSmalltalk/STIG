"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: STIG
"
stigToDisk

	| fromDisk deltas layout |
	layout := DirectoryLayout for: self.
	fromDisk := layout packageFromDisk: self name.
	fromDisk directory ensureDirectory.
	fromDisk read: layout.
	deltas := layout deltaSetsFrom: fromDisk to: self.
	layout saveDeltas: deltas directory: fromDisk
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: STIG
"
stigFromDisk

	| layout |
	layout := DirectoryLayout for: self.
	self stigFromDisk: ((layout packageFromDisk: self name) read: layout)
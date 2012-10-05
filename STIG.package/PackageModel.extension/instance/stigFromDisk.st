STIG
stigFromDisk

	| layout |
	layout := DirectoryLayout root: self stigRoot.
	self stigFromDisk: ((layout packageFromDisk: self name) read: layout)
selfRead
	"| read |
	[read := self selfRead] timeToRun out.
	read blueprints"

	| fromDisk layout |
	layout := DirectoryLayout root: 'STIG'.
	fromDisk := layout packageFromDisk: 'STIG'.
	fromDisk read: layout.
	^fromDisk
selfRead
	"| read |
	[read := self selfRead] timeToRun out.
	read blueprints"

	| fromDisk |
	fromDisk := PackageFromDisk
				forPackage: (Store.Registry packageNamed: 'STIG').
	fromDisk read: (DefaultLayout root: 'STIG').
	^fromDisk
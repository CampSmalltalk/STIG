instance creation
root: dir

	| type file |
	type := (file := dir asFilename / 'properties.json') exists
		ifTrue: [ self halt ]
		ifFalse: [ DefaultLayout ].
	^type new root: dir
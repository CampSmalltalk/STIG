"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: instance creation
"
root: dir

	| layout file |
	layout := (file := dir asFilename / 'properties.json') exists
		ifTrue: [ | properties formatName |
			properties := JSON read: file contentsOfEntireFile readStream.
			formatName := properties at: 'format'.
			(self allSubclasses detect: [ :c | c name sameAs: formatName ]) new
				format: properties;
				yourself ]
		ifFalse: [ DefaultLayout new ].
	^layout root: dir
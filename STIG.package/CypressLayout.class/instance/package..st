"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: initialize-release
"
package: model

	| file |
	super package: model.
	copyrightLine := model stigCopyright.
	file := model stigRoot asFilename / 'properties.ston'.
	file exists ifTrue: [ self format: (JSON read: file contentsOfEntireFile readStream) ]
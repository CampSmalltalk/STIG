"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: instance creation
"
for: package

	| layout |
	layout := DefaultLayout.
	(package stigRoot asFilename / 'properties.ston') exists ifTrue: [ layout := CypressLayout ].
	^layout new
		package: package;
		yourself
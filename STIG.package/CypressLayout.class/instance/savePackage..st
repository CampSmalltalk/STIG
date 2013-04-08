"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: saving
"
savePackage: aPackage

	| path blueprints comment |
	path := Array with: aPackage packageName, '.package'.
	(comment := aPackage imagePackage comment) size = 0 ifFalse: [
		self path: path tail: self commentFile write: [ :ws | ws nextPutAll: comment] ].
	aPackage imagePackage copyrightNotice ifNotNil: [ :license |
		(license occurrencesOf: Character cr) > 3 ifTrue: [
			self path: path tail: self licenseFile write: [ :ws | ws nextPutAll: comment] ] ].
	blueprints := aPackage imagePackage propertyBlueprints reject: [ :bp | IgnoredProperties includes: bp key ].
	blueprints := blueprints inject: Dictionary new into: [ :d :bp | d at: bp key put: bp value; yourself ].
	package stigCopyright isEmpty ifFalse: [ blueprints at: '_cypress_copyright' put: package stigCopyright ].
	self path: path tail: self propertyFile write: [ :ws | blueprints jsonWriteOn: ws ]
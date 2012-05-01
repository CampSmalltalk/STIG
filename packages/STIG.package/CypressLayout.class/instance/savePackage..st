saving
savePackage: package

	| path blueprints comment |
	path := Array with: package packageName, '.package'.
	(comment := package imagePackage comment) size = 0 ifFalse: [
		self path: path tail: self commentFile write: [ :ws | ws nextPutAll: comment] ].
	blueprints := package imagePackage propertyBlueprints reject: [ :bp | IgnoredProperties includes: bp key ].
	blueprints := blueprints inject: Dictionary new into: [ :d :bp | d at: bp key put: bp value; yourself ].
	self path: path tail: self propertyFile write: [ :ws | blueprints jsonWriteOn: ws ]
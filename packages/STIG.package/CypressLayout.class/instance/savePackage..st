savePackage: package

	| path blueprints comment |
	path := Array with: package packageName, '.package'.
	(comment := package imagePackage comment) size = 0 ifFalse: [
		self path: path tail: CommentFile write: [ :ws | ws nextPutAll: comment] ].
	blueprints := package propertyBlueprints reject: [ :bp | #(comment STIGRoot) includes: bp key ].
	blueprints := blueprints inject: Dictionary new into: [ :d :bp | d at: bp key put: bp value; yourself ].
	self path: path tail: PropertyFile write: [ :ws | blueprints jsonWriteOn: ws ]
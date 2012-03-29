savePackage: package

	| path blueprints |
	path := Array with: package packageName, '.package'.
	blueprints := package propertyBlueprints reject: [ :bp | #(comment STIGRoot) includes: bp key ].
	blueprints := blueprints inject: Dictionary new into: [ :d :bp | d at: bp key put: bp value; yourself ].
	self path: path tail: PropertyFile write: [ :ws | blueprints jsonWriteOn: ws ]
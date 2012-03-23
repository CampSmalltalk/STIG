savePackage: package

	| path blueprints |
	path := Array with: package name, '.package'.
	blueprints := package propertyBlueprints reject: [ :bp | bp key = #comment ].
	blueprints := blueprints inject: Dictionary new into: [ :d :bp | d at: bp key put: bp value; yourself ].
	self path: path
		tail: 'properties.json'
		writeJson: blueprints
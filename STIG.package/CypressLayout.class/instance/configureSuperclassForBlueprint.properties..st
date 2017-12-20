"
notice: 
category: private
"
configureSuperclassForBlueprint: blueprint properties: properties
	" Find the superclass reference in properties and set it to the right class in the blueprint. I exist because you can't just resolve a superclass from a name, because if the superclass is in a package you're currently loading, then it doesn't exist yet. "
	| superref |
	superref := ((properties at: 'superNamespace' ifAbsent: [nil]) ifNil: [''] ifNotNil: [ :ns | ns, '.' ]), (properties at: 'super').
	blueprint superclassName: superref.
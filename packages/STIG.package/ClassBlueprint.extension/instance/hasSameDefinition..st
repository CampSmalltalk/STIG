testing
hasSameDefinition: aBlueprint
	"We assume we know its for the same reference"

	^(super hasSameDefinition: aBlueprint) and: 
			[instanceVariables = aBlueprint instanceVariables and: 
					[superclassReference = aBlueprint superclassReference and: 
							[behaviorType = aBlueprint behaviorType and: 
									[classInstanceVariables = aBlueprint classInstanceVariables
										and: [attributes = aBlueprint attributes]]]]]
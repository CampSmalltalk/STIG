hasSameDefinition: aBlueprint
	"We assume we know its for the same reference"

	^importsString = aBlueprint importsString
		and: [isPrivate = aBlueprint isPrivate]
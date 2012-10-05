comparing
refersToSameObject: aPropertyBlueprint

	^key = aPropertyBlueprint key and: 
			[codeComponentName = aPropertyBlueprint codeComponentName
				and: [isBundle = aPropertyBlueprint isBundle]]
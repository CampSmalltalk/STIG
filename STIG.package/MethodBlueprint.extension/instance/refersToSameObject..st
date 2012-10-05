comparing
refersToSameObject: aMethodBlueprint

	^selector = aMethodBlueprint selector and: 
			[classReference = aMethodBlueprint classReference
				and: [isInstanceBehavior == aMethodBlueprint isInstanceBehavior]]
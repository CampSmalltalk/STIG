"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: comparing
"
refersToSameObject: aMethodBlueprint

	^selector = aMethodBlueprint selector and: 
			[classReference = aMethodBlueprint classReference
				and: [isInstanceBehavior == aMethodBlueprint isInstanceBehavior]]
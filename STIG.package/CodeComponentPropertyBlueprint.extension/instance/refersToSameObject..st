"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: comparing
"
refersToSameObject: aPropertyBlueprint

	^key = aPropertyBlueprint key and: 
			[codeComponentName = aPropertyBlueprint codeComponentName
				and: [isBundle = aPropertyBlueprint isBundle]]
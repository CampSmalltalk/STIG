private
encodeImportsString: aBlueprint

	^aBlueprint importsString
		collect: [:each | each = Character cr ifTrue: [$\] ifFalse: [each]]
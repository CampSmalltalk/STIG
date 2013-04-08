"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
encodeImportsString: aBlueprint

	^aBlueprint importsString
		collect: [:each | each = Character cr ifTrue: [$\] ifFalse: [each]]
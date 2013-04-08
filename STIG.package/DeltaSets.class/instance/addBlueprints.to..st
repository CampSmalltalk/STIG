"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
addBlueprints: aSequence to: aBlueprintCollection

	aSequence isEmpty ifTrue: [^self].
	aBlueprintCollection
		addAllLast: (aSequence any class sortForDoingImageUpdates: aSequence)
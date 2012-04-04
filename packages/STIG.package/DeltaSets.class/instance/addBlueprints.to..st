private
addBlueprints: aSequence to: aBlueprintCollection

	aSequence isEmpty ifTrue: [^self].
	aBlueprintCollection
		addAllLast: (aSequence any class sortForDoingImageUpdates: aSequence)
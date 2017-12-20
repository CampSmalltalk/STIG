"
notice: 
category: private
"
addBlueprints: aSequence to: aBlueprintCollection

	aSequence isEmpty ifTrue: [^self].
	" TODO: what does sortForDoingImageUpdates: do? Why? 
	I've already put stuff in the right order. Why do it again? 
	aBlueprintCollection
		addAllLast: (aSequence any class sortForDoingImageUpdates: aSequence)"

	aBlueprintCollection addAllLast: aSequence.
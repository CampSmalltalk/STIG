"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
emitModificationFrom: aBlueprint changesTo: aCompositeChange
	"Some subclasses get more specific than this."

	^self emitAdditionChangesTo: aCompositeChange
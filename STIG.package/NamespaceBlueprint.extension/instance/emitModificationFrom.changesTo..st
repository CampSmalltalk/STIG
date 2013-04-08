"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
emitModificationFrom: anOriginalBlueprint changesTo: aCompositeChange

	(anOriginalBlueprint hasSameDefinition: self)
		ifFalse: 
			[aCompositeChange
				addChange: (Refactory.Browser.AddNameSpaceChange new fromBlueprint: self)].
	(anOriginalBlueprint hasSameComment: self)
		ifFalse: [aCompositeChange addChange: self asCommentUpdateChange]
emitAdditionChangesTo: aCompositeChange

	aCompositeChange
		addChange: self asDefinitionUpdateChange;
		addChange: self asCommentUpdateChange
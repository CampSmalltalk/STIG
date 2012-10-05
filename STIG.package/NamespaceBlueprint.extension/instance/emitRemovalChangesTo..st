converting
emitRemovalChangesTo: aCompositeChange

	aCompositeChange addChange: (Refactory.Browser.RemoveNameSpaceChange
				objectName: reference asString)
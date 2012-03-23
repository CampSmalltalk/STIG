emitRemovalChangesTo: aCompositeChange

	aCompositeChange addChange: (Refactory.Browser.RemoveSharedVariableChange
				objectName: reference asString)
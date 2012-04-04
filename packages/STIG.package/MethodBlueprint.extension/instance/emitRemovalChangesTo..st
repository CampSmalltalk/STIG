converting
emitRemovalChangesTo: aCompositeChange

	aCompositeChange
		addChange: (Refactory.Browser.RemoveMethodChange remove: selector
				from: self liveClass)
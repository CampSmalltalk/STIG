"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
emitRemovalChangesTo: aCompositeChange

	aCompositeChange
		addChange: (Refactory.Browser.RemoveMethodChange remove: selector
				from: self liveClass)
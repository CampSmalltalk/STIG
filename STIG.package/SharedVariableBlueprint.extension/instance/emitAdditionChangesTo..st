"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
emitAdditionChangesTo: aCompositeChange

	aCompositeChange addChange: (Refactory.Browser.AddSharedVariableChange new
				fromBlueprint: self)
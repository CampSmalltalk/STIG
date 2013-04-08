"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
emitAdditionChangesTo: aCompositeChange

	| change |
	change := Refactory.Browser.AddMethodChange new.
	change source: self source.
	change objectName: self classReference asString.
	change isMeta: self isInstanceBehavior not.
	change protocols: self category.
	aCompositeChange addChange: change
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
emitAdditionChangesTo: aCompositeChange

	| change |
	change := (Refactory.Browser.CodeComponentPropertyChange
				component: (isBundle
						ifTrue: [Store.Registry bundleNamed: codeComponentName]
						ifFalse: [Store.Registry packageNamed: codeComponentName]))
				propertyKey: key;
				propertyValue: value;
				yourself.
	aCompositeChange addChange: change
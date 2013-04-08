"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
emitRemovalChangesTo: aCompositeChange

	| change |
	change := (Refactory.Browser.CodeComponentPropertyChange
				component: (isBundle
						ifTrue: [Store.Registry bundleNamed: codeComponentName]
						ifFalse: [Store.Registry packageNamed: codeComponentName]))
				propertyKey: key;
				propertyValue: nil;
				yourself.
	aCompositeChange addChange: change
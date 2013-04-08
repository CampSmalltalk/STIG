"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: initialize-release
"
initialize

	super initialize.
	propertyBlueprints := OrderedCollection new.
	namespaceBlueprints := OrderedCollection new.
	classBlueprints := OrderedCollection new.
	sharedVariableBlueprints := OrderedCollection new.
	methodBlueprints := OrderedCollection new
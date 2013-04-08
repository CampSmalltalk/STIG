"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: initialize-release
"
fromSource: aBlueprintProvider

	self fromProperties: aBlueprintProvider propertyBlueprints.
	self fromNamespaces: aBlueprintProvider namespaceBlueprints.
	self fromClasses: aBlueprintProvider classBlueprints.
	self fromShares: aBlueprintProvider sharedVariableBlueprints.
	self fromMethods: aBlueprintProvider methodBlueprints
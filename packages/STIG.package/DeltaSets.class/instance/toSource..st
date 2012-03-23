toSource: aBlueprintProvider

	self toProperties: aBlueprintProvider propertyBlueprints.
	self toNamespaces: aBlueprintProvider namespaceBlueprints.
	self toClasses: aBlueprintProvider classBlueprints.
	self toShares: aBlueprintProvider sharedVariableBlueprints.
	self toMethods: aBlueprintProvider methodBlueprints
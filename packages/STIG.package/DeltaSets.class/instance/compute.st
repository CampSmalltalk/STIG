compute

	additions := OrderedCollection new.
	removals := OrderedCollection new.
	changes := OrderedCollection new.
	originals := OrderedCollection new.
	self compareFromBlueprints: fromProperties toBlueprints: toProperties.
	self compareFromBlueprints: fromNamespaces toBlueprints: toNamespaces.
	self compareFromBlueprints: fromClasses toBlueprints: toClasses.
	self compareFromBlueprints: fromShares toBlueprints: toShares.
	self compareFromBlueprints: fromMethods toBlueprints: toMethods
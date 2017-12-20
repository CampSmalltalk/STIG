"
notice: 
category: private
"
compute
	| toClassesInOrder |
	additions := OrderedCollection new.
	removals := OrderedCollection new.
	changes := OrderedCollection new.
	originals := OrderedCollection new.

	self compareFromBlueprints: (fromProperties sort) toBlueprints: (toProperties sort).
	self compareFromBlueprints: (fromNamespaces sort) toBlueprints: (toNamespaces sort).

	toClassesInOrder := self sortClassesByDependencies: toClasses.
	self compareFromBlueprints: (fromClasses sort) toBlueprints: toClassesInOrder.

	self compareFromBlueprints: (fromShares sort) toBlueprints: (toShares sort).
	self compareFromBlueprints: (fromMethods sort) toBlueprints: (toMethods sort)
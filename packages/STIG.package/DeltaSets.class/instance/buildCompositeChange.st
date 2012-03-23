buildCompositeChange

	| composite |
	composite := Refactory.Browser.CompositeRefactoryChange new.
	additions do: [:each | each emitAdditionChangesTo: composite].
	changes with: originals
		do: [:eachChange :eachOriginal | eachChange emitModificationChangesTo: composite relativeTo: eachOriginal].
	removals reverseDo: [:each | composite emitRemovalChangesTo: composite].
	^composite
"
notice: 
category: API
"
buildCompositeChange

	| composite |
	composite := Refactory.Browser.CompositeRefactoryChange new.
	additions do: [:each | each emitAdditionChangesTo: composite].
	changes with: originals
		do: [:eachChange :eachOriginal | eachChange emitModificationFrom: eachOriginal changesTo:composite].
	removals reverseDo: [:each | each emitRemovalChangesTo: composite].
	^composite
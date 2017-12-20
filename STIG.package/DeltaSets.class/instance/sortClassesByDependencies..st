"
notice: 
category: private
"
sortClassesByDependencies: c
	 " sort the given list of classes, putting superclasses first and subclasses last. c is a list of PossiblyUnresolvedClassBlueprints"
	| result remaining addUs |
	result := OrderedCollection new.
	remaining := OrderedCollection new.
	c do: [ :each | 
		(each isMemberOf: PossiblyUnresolvedClassBlueprint)
			ifTrue: [ remaining addLast: each ]
			ifFalse: [ result addLast: each ].
	].

	
	" Add everything that already has a superclass in the image. "
	remaining copy do: [ :each | 
		each isResolved ifTrue: [ 
			result add: each.
			remaining remove: each.
		].
	].

	" Iteratively add anything which has a superclass in result. "
	[
		addUs := remaining select: [ :each |
			result 
				detect: [ :eachSuper | eachSuper isSuperclassBlueprintOf: each ]
				ifFound: [ true ]
				ifNone: [ false ].
		].
		addUs isEmpty not
	] whileTrue: [
		result addAll: addUs.
		remaining removeAll: addUs.
	].

	" The remaining classes have no superclasses in the image and will later cause a compilation error. "
	result addAll: remaining.
	^ result.
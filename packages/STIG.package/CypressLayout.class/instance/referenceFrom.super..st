referenceFrom: properties super: isSuper

	| name namespace reference |
	name := properties at: (isSuper ifTrue: ['super'] ifFalse: ['name']).
	namespace := properties at: (isSuper ifTrue: [ 'superNamespace' ] ifFalse: [ 'namespace' ]) ifAbsent: [nil].
	namespace := namespace ifNil: [''] ifNotNil: [ namespace, '.' ]. 
	reference := namespace, name.
	^reference asQualifiedReference makeUnambiguous.
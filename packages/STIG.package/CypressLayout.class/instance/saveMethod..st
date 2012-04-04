saving
saveMethod: blueprint

	| path tail reference classDirectory properties |
	reference := blueprint classReference.
	classDirectory := classPaths at: reference ifAbsentPut: [ | dir |
		dir := Array with: blueprint packageName, '.package'.
		(definedClasses includes: reference)
			ifTrue: [ dir := dir copyWith: reference name, '.class' ]
			ifFalse: [ dir := dir copyWith: reference name, '.extension'.
				properties := Dictionary new at: 'name' put: reference name; yourself.
				(IgnoredNamespaces includes: reference environment) ifFalse: [
					properties at: 'namespace' put: reference environment fullName ].
				self path: dir tail: PropertyFile write: [ :ws | properties jsonWriteOn: ws ].
				dir ] ].
	path := classDirectory copyWith: (blueprint isInstanceBehavior ifTrue: ['instance'] ifFalse: ['class']).
	tail := self encodeSelector: blueprint selector.
	self path: path tail: tail, '.st' write: [:ws |
		ws	nextPutAll: blueprint category; cr;
			nextPutAll: blueprint source]
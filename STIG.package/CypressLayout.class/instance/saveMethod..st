"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: saving
"
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
				self path: dir tail: self propertyFile write: [ :ws | properties jsonWriteOn: ws ].
				dir ] ].
	path := classDirectory copyWith: (blueprint isInstanceBehavior ifTrue: ['instance'] ifFalse: ['class']).
	tail := self encodeSelector: blueprint selector.
	self path: path tail: tail, '.st' write: [:ws |
		ws	nextPut: $"; cr;
			nextPutAll: 'notice: '; nextPutAll: (copyrightLine ifNil: ['']); cr;
			nextPutAll: 'category: '; nextPutAll: blueprint category; cr;
			nextPut: $"; cr;
			nextPutAll: blueprint source]
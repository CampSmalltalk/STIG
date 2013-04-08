"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
makeReference: properties
	
	| ref |
	ref := (properties at: 'namespace' ifAbsent: [ nil ])
			ifNil: [ 'Root.Smalltalk.' ]
			ifNotNil: [ :ns | 'Root.Smalltalk.', ns, '.' ].
	ref := ref, (properties at: 'name').
	ref := ref asQualifiedReference.
	^ref bindingOrNil
		ifNil: [ ref ]
		ifNotNil: [ :binding | binding absoluteName asQualifiedReference makeUnambiguous ]
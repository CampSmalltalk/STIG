"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
shortReferencePath: aBindingReference

	| sequence |
	sequence := aBindingReference path.
	^(sequence beginsWith: #(#Root #Smalltalk))
		ifTrue: [sequence allButFirst: 2]
		ifFalse: [sequence]
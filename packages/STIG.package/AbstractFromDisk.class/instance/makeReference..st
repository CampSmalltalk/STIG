makeReference: aSequence

	^BindingReference path: ((aSequence beginsWith: #('Root' 'Smalltalk'))
				ifFalse: [#('Root' 'Smalltalk') , aSequence]
				ifTrue: [aSequence])
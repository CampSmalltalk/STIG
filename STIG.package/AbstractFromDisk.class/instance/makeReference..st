"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
makeReference: aSequence

	^BindingReference path: ((aSequence beginsWith: #('Root' 'Smalltalk'))
				ifFalse: [#('Root' 'Smalltalk') , aSequence]
				ifTrue: [aSequence])
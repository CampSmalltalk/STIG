instanceVariablesString: aSequence

	^aSequence isEmpty
		ifTrue: [String new]
		ifFalse: [aSequence fold: [:a :b | a , ' ' , b]]
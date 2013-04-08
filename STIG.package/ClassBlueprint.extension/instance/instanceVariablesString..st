"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: accessing
"
instanceVariablesString: aSequence

	^aSequence isEmpty
		ifTrue: [String new]
		ifFalse: [aSequence fold: [:a :b | a , ' ' , b]]
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
get

	^char ifNil: [ stream next ]
		ifNotNil: [ :c | char := nil. c ]
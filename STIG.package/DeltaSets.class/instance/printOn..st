"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: printing
"
printOn: aStream

	aStream nextPut: $+; print: additions size; nextPutAll: ' / ';
		nextPut: $*; print: changes size; nextPutAll: ' / ';
		nextPut: $-; print: removals size
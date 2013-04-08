"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: printing
"
printOn: aStream

	aStream nextPutAll: codeComponentName;
		nextPutAll: '::';
		nextPutAll: key;
		nextPutAll: ' = ';
		print: value
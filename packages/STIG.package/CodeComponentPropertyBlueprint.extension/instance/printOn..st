printing
printOn: aStream

	aStream nextPutAll: codeComponentName;
		nextPutAll: '::';
		nextPutAll: key;
		nextPutAll: ' = ';
		print: value
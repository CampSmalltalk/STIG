"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
fileContents: aFile

	| bytes fd size buffer output totalRead |
	fd := IOAccessor defaultForFiles new initialize
				handle: (aFile primOpenDirection: 0 creation: 0).
	
	[size := fd fileSize.
	buffer := ByteArray new: 256.
	output := ByteArray new writeStream.
	totalRead := 0.
	[totalRead < size] whileTrue: 
			[| thisRead |
			thisRead := fd readInto: buffer startingAt: 1 for: 256.
			totalRead := totalRead + thisRead.
			output next: thisRead putAll: buffer startingAt: 1]]
			ensure: [fd primClose].
	bytes := output contents.
	^self translateUTF8Bytes: bytes
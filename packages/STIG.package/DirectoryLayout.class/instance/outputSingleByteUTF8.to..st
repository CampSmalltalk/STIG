private-writing
outputSingleByteUTF8: string to: fd

	| bytes toWrite written |
	string class == ByteString ifFalse: [^false].
	bytes := ByteArray new: string size.
	bytes
		replaceBytesFrom: 1
		to: string size
		with: string
		startingAt: 1
		map: CRswapLF.
	(self needsMultiByte: bytes) ifTrue: [^false].
	toWrite := bytes size.
	written := 0.
	[written < toWrite] whileTrue: 
			[| thisWrite |
			thisWrite := fd
						writeFrom: bytes
						startingAt: written + 1
						for: toWrite - written.
			written := written + thisWrite].
	^true
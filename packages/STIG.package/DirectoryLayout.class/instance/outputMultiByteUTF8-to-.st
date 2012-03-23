outputMultiByteUTF8: string to: fd

	| buffer bufferIndex written |
	buffer := ByteArray new: 256 + 3.
	bufferIndex := 1.
	1 to: string size
		do: 
			[:n |
			| char |
			char := string at: n.
			written := char emitUTF8Into: buffer startingAt: bufferIndex.
			bufferIndex := bufferIndex + written.
			bufferIndex >= 256
				ifTrue: 
					[fd
						writeFrom: buffer
						startingAt: 1
						for: bufferIndex - 1.
					bufferIndex := 1]].
	bufferIndex > 1
		ifTrue: 
			[fd
				writeFrom: buffer
				startingAt: 1
				for: bufferIndex - 1]
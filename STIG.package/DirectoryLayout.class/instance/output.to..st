private-writing
output: string to: fd

	(self outputSingleByteUTF8: string to: fd)
		ifFalse: [self outputMultiByteUTF8: string to: fd]
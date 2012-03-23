translateUTF8Bytes: aByteArray

	^(self translateSingleByteUTF8: aByteArray)
		ifNil: [self translateMultiByteUTF8: aByteArray]
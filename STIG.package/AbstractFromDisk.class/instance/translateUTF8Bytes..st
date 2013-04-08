"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
translateUTF8Bytes: aByteArray

	^(self translateSingleByteUTF8: aByteArray)
		ifNil: [self translateMultiByteUTF8: aByteArray]
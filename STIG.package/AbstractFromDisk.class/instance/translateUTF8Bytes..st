"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
translateUTF8Bytes: aByteArray

	^(self translateSingleByteUTF8: aByteArray)
		ifNil: [ (aByteArray withEncoding: #utf8) readStream
				setLineEndConventionFromContents;
				upToEnd ]
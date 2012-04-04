private
translateSingleByteUTF8: aByteArray

	| translated |
	translated := ByteArray new: aByteArray size.
	translated
		replaceBytesFrom: 1
		to: aByteArray size
		with: aByteArray
		startingAt: 1
		map: CRswapLF.
	^(translated includes: 255)
		ifTrue: [nil]
		ifFalse: [translated changeClassTo: ByteString]
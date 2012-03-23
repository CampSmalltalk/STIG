path: aDirectorySequence tail: aFiletail writeJson: aDictionary

	self path: aDirectorySequence tail: aFiletail write: [ :ws |
		ws nextPutAll: '{	'.	
		aDictionary keys sorted
			do: [ :key | ws nextPut: $"; nextPutAll: key; nextPutAll: '" : "';
					print: (aDictionary at: key); nextPut: $" ]
			separatedBy: [ ws nextPut: $,; cr; tab ].
		ws cr; nextPut: $} ]
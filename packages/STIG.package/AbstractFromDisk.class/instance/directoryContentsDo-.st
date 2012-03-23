directoryContentsDo: aBlock

	directory directoryContents
		do: [:each | aBlock value: (directory trustedConstruct: each) value: each]
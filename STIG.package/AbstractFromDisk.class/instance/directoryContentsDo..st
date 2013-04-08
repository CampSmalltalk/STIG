"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: accessing
"
directoryContentsDo: aBlock

	directory directoryContents
		do: [:each | aBlock value: (directory trustedConstruct: each) value: each]
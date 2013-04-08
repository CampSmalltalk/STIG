"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
deltaSetsFrom: aPackage to: disk
	
	| deltas |
	deltas := DeltaSets from: aPackage to: disk.
	deltas trimProperties: IgnoredProperties.
	^deltas compute
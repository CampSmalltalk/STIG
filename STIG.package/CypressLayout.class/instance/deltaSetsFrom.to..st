private
deltaSetsFrom: package to: disk
	
	| deltas |
	deltas := DeltaSets from: package to: disk.
	deltas trimProperties: IgnoredProperties.
	^deltas compute
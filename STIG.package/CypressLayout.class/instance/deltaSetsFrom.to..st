"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
deltaSetsFrom: package to: disk
	
	| deltas |
	deltas := DeltaSets from: package to: disk.
	deltas trimProperties: IgnoredProperties.
	^deltas compute
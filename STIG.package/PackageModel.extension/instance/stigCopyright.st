"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: STIG
"
stigCopyright

	^self copyrightNotice
		ifNil: [ '' ]
		ifNotNil: [ :notice | notice readStream upTo: Character cr ]
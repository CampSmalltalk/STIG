"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: instance creation
"
from: aFromProvider to: aToProvider

	^(self new)
		fromSource: aFromProvider;
		toSource: aToProvider;
		yourself
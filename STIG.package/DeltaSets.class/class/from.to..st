instance creation
from: aFromProvider to: aToProvider

	^(self new)
		fromSource: aFromProvider;
		toSource: aToProvider;
		yourself
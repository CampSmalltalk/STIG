"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: STIG
"
stigRoot

	^(self propertyAt: #STIGRoot ifAbsent: [ nil ]) ifNil: [ DefaultRoot ]
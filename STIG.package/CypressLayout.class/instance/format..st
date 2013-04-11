"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: initialize-release
"
format: properties

	(properties at: 'commentFile' ifAbsent: nil) ifNotNil: [ :v | commentFile := v ].
	(properties at: 'licenseFile' ifAbsent: nil) ifNotNil: [ :v | licenseFile := v ].
	(properties at: 'propertyFile' ifAbsent: nil) ifNotNil: [ :v | propertyFile := v ].
	(properties at: 'copyrightLine' ifAbsent: nil) ifNotNil: [ :v | copyrightLine := v ].
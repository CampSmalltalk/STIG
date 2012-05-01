accessing
format: properties

	(properties at: 'version' ifAbsent: nil) ifNotNil: [ :v | version := v ].
	(properties at: 'commentFile' ifAbsent: nil) ifNotNil: [ :v | commentFile := v ].
	(properties at: 'propertyFile' ifAbsent: nil) ifNotNil: [ :v | propertyFile := v ].
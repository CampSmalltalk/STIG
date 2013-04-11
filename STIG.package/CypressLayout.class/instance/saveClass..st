"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: saving
"
saveClass: blueprint

	| path name properties ns class |
	name := blueprint reference name.
	class := blueprint reference value.
	path := (Array with: blueprint packageName, '.package' with: name, '.class').
	blueprint comment size = 0 ifFalse: [
		self path: path tail: self commentFile write: [ :ws | ws nextPutAll: blueprint comment] ].
	properties := Dictionary new.
	properties at: 'name' put: name.
	(IgnoredNamespaces includes: (ns := blueprint reference environment)) ifFalse: [
		properties at: 'namespace' put: ns fullName ].
	blueprint superclassReference ifNotNil: [
		properties at: 'super' put: blueprint superclassReference name.
		(IgnoredNamespaces includes: (ns := blueprint superclassReference environment)) ifFalse: [
			properties at: 'superNamespace' put: ns fullName ] ].
	blueprint behaviorType == #none ifFalse: [ properties at: '_vw_type' put: blueprint behaviorType ].
	blueprint instanceVariables isEmpty ifFalse: [ properties at: 'instvars' put: blueprint instanceVariables ].
	blueprint classInstanceVariables isEmpty ifFalse: [ properties at: 'classinstvars' put: blueprint classInstanceVariables ].
	class classVariablesString isEmpty ifFalse: [
		properties at: 'classvars' put: (class classVariablesString trimBlanks tokensBasedOn: $ ) asArray ].
	blueprint importsString isEmpty ifFalse: [ properties at: '_vw_imports' put: (self encodeImportsString: blueprint) ].
	blueprint isPrivate ifTrue: [ properties at: '_vw_private' put: blueprint isPrivate ].
	blueprint attributes isEmpty ifFalse: [ properties at: '_vw_attributes' put: blueprint attributes ].
	copyrightLine ifNotNil: [ properties at: '_cypress_copyright' put: copyrightLine ].
	self path: path tail: self propertyFile write: [ :ws | properties jsonWriteOn: ws ]
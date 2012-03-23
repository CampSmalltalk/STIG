load: aBlueprint superclassReference: aString

	aBlueprint
		superclassReference: (Compiler evaluate: aString) asString
				asQualifiedReference makeUnambiguous
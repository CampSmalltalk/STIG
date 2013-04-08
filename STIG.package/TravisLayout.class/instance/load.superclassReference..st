"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
load: aBlueprint superclassReference: aString

	aBlueprint
		superclassReference: (Compiler evaluate: aString) asString
				asQualifiedReference makeUnambiguous
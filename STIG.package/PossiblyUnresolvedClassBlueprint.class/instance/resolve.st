"
notice: 
category: accessing
"
resolve
	| class binding |
	class := Compiler evaluate: superclassName.
	class isNil ifTrue: [
		" The class is missing. We assume it's in the package we are currently loading. "
		binding := BindingReference simpleName: superclassName in: nil.
		self superclassReference: binding.
	] ifFalse: [
		self superclassReference: class fullName asQualifiedReference makeUnambiguous.
	].
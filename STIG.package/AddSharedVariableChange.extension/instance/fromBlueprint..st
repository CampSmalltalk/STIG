"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: initialize-release
"
fromBlueprint: aSharedVariableBlueprint

	isConstant := aSharedVariableBlueprint isConstant.
	isPrivate := aSharedVariableBlueprint isPrivate.
	category := aSharedVariableBlueprint category.
	initializer := aSharedVariableBlueprint initializer.
	objectName := aSharedVariableBlueprint reference asString.
	nameSpaceName := aSharedVariableBlueprint reference environmentName.
	self package: aSharedVariableBlueprint livePackage.
	definition := '<1s> defineSharedVariable: #<2s>
	private: <3p>
	constant: <4p>
	category: <5p>
	initializer: <6p>'
				expandMacrosWithArguments: (Array with: nameSpaceName
						with: aSharedVariableBlueprint reference simpleName) , (Array
									with: isPrivate
									with: isConstant
									with: category
									with: initializer)
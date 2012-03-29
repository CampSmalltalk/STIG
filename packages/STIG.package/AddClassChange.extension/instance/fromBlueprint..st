fromBlueprint: aClassBlueprint

	imports := self parseImports: aClassBlueprint importsString.
	isPrivate := aClassBlueprint isPrivate.
	superclassName := aClassBlueprint superclassReference ifNotNil: #asString.
	instanceVariableNames := aClassBlueprint instanceVariables.
	classInstanceVariableNames := aClassBlueprint classInstanceVariables.
	indexedType := aClassBlueprint behaviorType.
	objectName := aClassBlueprint reference asString.
	nameSpaceName := aClassBlueprint reference environmentName.
	self package: aClassBlueprint livePackage.
	definition := '<1s> defineClass: #<2s>
	superclass: <3p>
	indexedType: <4p>
	private: <5p>
	instanceVariableNames: <6p>
	classInstanceVariableNames: <7p>
	imports: <8p>
	category: '''''
				expandMacrosWithArguments: (Array
						with: nameSpaceName
						with: aClassBlueprint reference simpleName
						with: aClassBlueprint superclassReference
						with: indexedType) , (Array
									with: isPrivate
									with: aClassBlueprint instanceVariablesString
									with: aClassBlueprint classInstanceVariablesString
									with: aClassBlueprint importsString)
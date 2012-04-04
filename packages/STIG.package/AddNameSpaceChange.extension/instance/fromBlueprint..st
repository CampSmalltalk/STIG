initialize-release
fromBlueprint: aNamespaceBlueprint

	imports := self parseImports: aNamespaceBlueprint importsString.
	isPrivate := aNamespaceBlueprint isPrivate.
	objectName := aNamespaceBlueprint reference asString.
	nameSpaceName := aNamespaceBlueprint reference environmentName.
	self package: aNamespaceBlueprint livePackage.
	definition := '<1s> defineNameSpace: #<2s>
	private: <3p>
	imports: <4p>
	category: '''''
				expandMacrosWithArguments: (Array
						with: nameSpaceName
						with: aNamespaceBlueprint reference simpleName
						with: isPrivate
						with: aNamespaceBlueprint importsString)
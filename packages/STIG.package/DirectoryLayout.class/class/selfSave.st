utility
selfSave
	"[self selfSave] timeToRun out"

	| blueprints package toDisk |
	blueprints := OrderedCollection new.
	package := Store.Registry packageNamed: 'STIG'.
	blueprints
		addAll: package propertyBlueprints;
		addAll: package classBlueprints;
		addAll: package namespaceBlueprints;
		addAll: package sharedVariableBlueprints;
		addAll: package methodBlueprints.
	toDisk := DefaultLayout root: 'STIG'.
	toDisk saveAll: blueprints
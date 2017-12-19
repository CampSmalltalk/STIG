"
notice: 
category: STIG
"
stigActionImport
	| dialog |
	dialog := ChooseDirectoryDialog new.
	dialog windowTitle: 'Import from Cypress project'.
	"dialog setFileFilterMatching: '*.package'."
	
	dialog open
		ifTrue: [ self halt ].
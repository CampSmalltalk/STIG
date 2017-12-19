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
		ifTrue: [ | pkg newState a |
			a := dialog selection tail tokensBasedOn: $. .
			a isEmpty ifTrue: [ 
				Dialog warn: 'Directory has no name'. " e.g. selecting '.'"
				^ nil.
			].
			
			((a last) = 'package') ifFalse: [
				Dialog warn: 'Directory does not have suffix ''.package'''.
				^ nil.
			].
			" based on >>storeCreatePackage"
			pkg := Store.PackageModel named: (dialog selection tail allButLast: ('.package' size)).
			
			pkg propertyAt: #STIGRoot put: (dialog selection directory).
			pkg stigFromDisk.
			
			self isBundleSelected ifTrue: [ self pundle addItem: pkg ].
			
			" Not sure what this does. "
			newState := self getState.
			newState pundle: pkg.
			self updateWithState: newState.
		].
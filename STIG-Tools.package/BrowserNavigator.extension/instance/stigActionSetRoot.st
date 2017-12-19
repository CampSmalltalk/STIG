"
notice: 
category: STIG
"
stigActionSetRoot
	| dialog p d |
	p := self packages.
	p isEmpty ifTrue: [
		^ nil 
	].
		
	d := self packages first propertyAt: #STIGRoot ifAbsent: STIG.DefaultRoot.
	
	dialog := ChooseDirectoryDialog new.
	dialog windowTitle: 'Root directory for these projects?';
		defaultDirectory: d.
	
	dialog open
		ifTrue: [ self packages do: [ :package | package propertyAt: #STIGRoot put: (dialog selection) ] ].
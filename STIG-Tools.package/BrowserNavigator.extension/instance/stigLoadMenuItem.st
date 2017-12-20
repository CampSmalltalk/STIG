"
notice: 
category: STIG
"
stigLoadMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 90.5>

	^(MenuItem labeled: 'Import...')
		value: [ self stigActionImport ]
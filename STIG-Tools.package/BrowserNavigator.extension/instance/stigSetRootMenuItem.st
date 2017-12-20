"
notice: 
category: menus
"
stigSetRootMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 90.5>

	^(MenuItem labeled: 'Set Root...')
		value: [ self stigActionSetRoot ]
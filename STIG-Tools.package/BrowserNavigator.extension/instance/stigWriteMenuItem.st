menus
stigWriteMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.1>

	^(MenuItem labeled: 'Write') value: [self packages do: #stigToDisk]
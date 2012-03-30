stigInitMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 90.1>

	^(MenuItem labeled: 'Init') value: [self stigInitPackages]
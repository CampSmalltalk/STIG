"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: menus
"
stigInitMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 90.1>

	^(MenuItem labeled: 'Init') value: [self stigInitPackages]
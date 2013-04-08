"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: menus
"
stigSubmenuItem
	<itemInMenu: #(#pundleMenu) position: 15.0>

	^(MenuItem labeled: 'STIG')
		nameKey: #stigMenu;
		submenu: Menu new;
		yourself
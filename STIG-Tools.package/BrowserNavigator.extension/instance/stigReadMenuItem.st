"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: menus
"
stigReadMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.1>

	^(MenuItem labeled: 'Read')
		value: [self packages do: [:eachPackage | eachPackage stigFromDisk]]
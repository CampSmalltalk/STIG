"
notice: 
category: menus
"
stigReadMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.1>

	^(MenuItem labeled: 'Read changes')
		value: [
			self packages do: [:eachPackage | eachPackage stigFromDisk].
			Dialog warn: 'Changes read'.
		]
"
notice: 
category: menus
"
stigWriteMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.1>

	^(MenuItem labeled: 'Write changes') value: [
		self packages do: #stigToDisk.
		Dialog warn: 'Changes written'.
	].
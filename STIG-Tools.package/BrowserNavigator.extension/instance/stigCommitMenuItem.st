menus
stigCommitMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.1>

	^(MenuItem labeled: 'Commit') value: [self stigCommitPackages]
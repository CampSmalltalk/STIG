"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: menus
"
stigCommitMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.1>

	^(MenuItem labeled: 'Commit') value: [self stigCommitPackages]
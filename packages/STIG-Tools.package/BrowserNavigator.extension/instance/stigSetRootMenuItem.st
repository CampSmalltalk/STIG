menus
stigSetRootMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 90.5>

	^(MenuItem labeled: 'Set Root')
		value: [
			(Dialog request: 'Root directory for this project?' initialAnswer: STIG.DefaultRoot)
				ifNotNil: [ :root | self packages do: [ :package | package propertyAt: #STIGRoot put: root ] ] ]
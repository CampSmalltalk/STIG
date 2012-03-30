stigDiffMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.6>

	^(MenuItem labeled: 'Diff')
		value: [
			(self packages collect: #stigDeltasFromDisk) do: [ :delta |
				Transcript cr; print: delta ] ]
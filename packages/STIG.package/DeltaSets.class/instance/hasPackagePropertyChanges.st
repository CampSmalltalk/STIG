hasPackagePropertyChanges

	^additions, removals, changes includes: [ :change | (change isKindOf: CodeComponentPropertyBlueprint) and: [ change key ~= #comment ] ]
hasPackagePropertyChanges

	^additions, removals, changes anySatisfy: [ :change | (change isKindOf: CodeComponentPropertyBlueprint) and: [ change key ~= #comment ] ]
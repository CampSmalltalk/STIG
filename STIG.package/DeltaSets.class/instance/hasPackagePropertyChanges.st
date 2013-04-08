"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: API
"
hasPackagePropertyChanges

	^additions, removals, changes anySatisfy: [ :change | (change isKindOf: CodeComponentPropertyBlueprint) and: [ change key ~= #comment ] ]
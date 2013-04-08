"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: accessing
"
saveAll: aCollection

	aCollection do: [:each | self save: each]
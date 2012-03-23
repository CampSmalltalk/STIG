saveAll: aCollection

	aCollection do: [:each | self save: each]
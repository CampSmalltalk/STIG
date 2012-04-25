private
trimProperties: ignored

	toProperties := toProperties reject: [ :each | ignored includes: each key ].
	fromProperties := fromProperties reject: [ :each | ignored includes: each key ].
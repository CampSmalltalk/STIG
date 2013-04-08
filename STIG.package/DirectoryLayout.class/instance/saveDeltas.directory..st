"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: saving
"
saveDeltas: deltas directory: fromDisk

	self
		saveAll: deltas additions;
		saveAll: deltas changes.
	deltas removals do: [:each | each original delete].
	self cleanDirectory: fromDisk directory
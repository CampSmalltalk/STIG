"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: commands
"
commitAll: aMessage

	self
		run: (#('commit' '-a' '--allow-empty-message' '-m') copyWith: aMessage)
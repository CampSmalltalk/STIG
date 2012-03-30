commitAll: aMessage

	self
		run: (#('commit' '-a' '--allow-empty-message' '-m') copyWith: aMessage)
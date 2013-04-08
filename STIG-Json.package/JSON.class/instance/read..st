"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private
"
read: count

	^char
		ifNil: [ stream next: count ]
		ifNotNil: [ | out |
			out := String new: count.
			out at: 1 put: self get.
			stream next: count - 1 into: out startingAt: 2.
			out ]
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: converting
"
asCommentUpdateChange

	^(Refactory.Browser.CommentChange new)
		objectName: reference asString;
		comment: self comment;
		yourself
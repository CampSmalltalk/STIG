asCommentUpdateChange

	^(Refactory.Browser.CommentChange new)
		objectName: reference asString;
		comment: self comment;
		yourself
"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: private-writing
"
path: aDirectorySequence tail: aFiletail write: aBlock

	| actualFilename stream fd string |
	stream := (String new: 256) writeStream.
	aBlock value: stream.
	string := stream contents.
	actualFilename := self ensureDirectory: aDirectorySequence.
	actualFilename := actualFilename construct: (self sanitize: aFiletail).
	fd := IOAccessor defaultForFiles new initialize
				handle: (actualFilename primOpenDirection: 1 creation: 3).
	self output: string to: fd.
	fd primClose
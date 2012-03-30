run: anArgumentArray

	| time result process exitCode |
	LogTimes
		ifTrue: 
			[Transcript
				cr;
				show: anArgumentArray first , ': ' , self packageName , '...'].
	process := ExternalProcess defaultClass new.
	time := 
			[result := process fork: 'git' arguments: globalArgs , anArgumentArray]
					timeToRun.
	LogTimes
		ifTrue: 
			[Transcript
				print: time;
				endEntry].
	LogOutput
		ifTrue: 
			[result trimSeparators isEmpty
				ifFalse: 
					[Transcript
						cr;
						show: result trimSeparators]].
	(exitCode := process exitStatus) isZero
		ifFalse: [self error: exitCode printString , ' - Git error: ' , result]
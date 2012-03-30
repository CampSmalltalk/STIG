stigCommitPackages

	| message |
	message := Dialog
				request: 'Commit Message:'
				initialAnswer: 'commit message'
				onCancel: [^self].
	message := message trimSeparators.
	self packages do: 
			[:eachPackage |
			eachPackage stigToDisk.
			(STIG.Git for: eachPackage) addAll.
			(STIG.Git for: eachPackage) commitAll: message]
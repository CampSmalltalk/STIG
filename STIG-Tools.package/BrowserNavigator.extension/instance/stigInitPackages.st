STIG
stigInitPackages

	self packages do: 
			[:eachPackage |
			eachPackage stigToDisk.
			(STIG.Git for: eachPackage) init]
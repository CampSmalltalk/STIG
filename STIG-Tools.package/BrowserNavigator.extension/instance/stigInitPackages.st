"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: STIG
"
stigInitPackages

	self packages do: 
			[:eachPackage |
			eachPackage stigToDisk.
			(STIG.Git for: eachPackage) init]
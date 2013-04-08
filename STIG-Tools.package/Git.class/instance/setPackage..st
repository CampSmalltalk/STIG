"
notice: Copyright 2012 Travis Griggs, Martin Kobetic
category: initialize-release
"
setPackage: aPackage

	globalArgs := Array with: '--git-dir='
						, (aPackage stigRoot asFilename / aPackage name / '.git') asString
				with: '--work-tree=' , (aPackage stigRoot asFilename / aPackage name) asString
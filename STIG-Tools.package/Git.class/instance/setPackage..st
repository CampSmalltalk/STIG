initialize-release
setPackage: aPackage

	globalArgs := Array with: '--git-dir='
						, (aPackage stigRoot asFilename / aPackage name / '.git') asString
				with: '--work-tree=' , (aPackage stigRoot asFilename / aPackage name) asString
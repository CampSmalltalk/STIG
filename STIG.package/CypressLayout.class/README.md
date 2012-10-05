Defines structure of a Cypress compatible repository.

Instance Variables
	classPaths	<Dictionary key: BindingReference value: (Array of: String)> maps classes/extensions to paths in the repository
	definedClasses	<Array of: BindingReference> caches classes defined by this package

Class Instance Variables
	specials	<Dictionary> maps binary selector characters to labels

Shared Variables
	CommentFile	<String> file name for comments (README)
	IgnoredNamespaces	<Set of: Namespace> these namespaces are not emitted into json files
	PropertyFile	<String> file name for properties (properties.json)


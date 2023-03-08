#!/bin/bash
npm install eslint @babel/core @babel/eslint-parser --save-dev
npm install eslint-config-wesbos
npm install prettier

touch .gitignore

echo 'node_modules' > .gitignore

touch .eslintrc
echo '{
	"parser": "@babel/eslint-parser",

	"overrides": [
		{

			"extends": [
				"wesbos",
				"eslint:recommended",
				"plugin:prettier/recommended"
			],

			"parserOptions": {
				"project": ["./tsconfig.json"], // Specify it only for TypeScript files
				"ecmaVersion": "latest",
				"sourceType": "module"
			},
			"rules": {
				"no-console": 0
			}
		}
	]
}

//combined Wes Bos eslintrc with this : https://stackoverflow.com/questions/58510287/parseroptions-project-has-been-set-for-typescript-eslint-parser
' > .eslintrc

touch .prettierrc

echo '{
        "trailingComma": "es5",
        "singleQuote": true,
        "printWidth": 120,
        "useTabs": true,
        "tabWidth": 8,
        "semicolons": true,
        "bracketSpacing": true,
        "arrowParens": "always",
        "endOfLine": "auto"

}
' > .prettierrc
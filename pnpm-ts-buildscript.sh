#!/bin/bash

# This script is used to build the project.
## Initiatlize git repo
git init

## Comment out lines 7-9 if you don't want to create a new repo on github
gh repo create --source=. --public
touch README.md
echo '# This repo was created with a shell script' >> README.md

pnpm init # Create a package.json file

echo '{
  "name": "pnpm-tsup-test",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
		"build": "tsup src/*.ts",
		"start": "npm run build"
  },
  "keywords": [],
  "author": "Johannes Chorzempa",
  "license": "ISC",
  "devDependencies": {
    "@babel/core": "^7.20.5",
		"@babel/eslint-parser": "^7.19.1",
		"@babel/preset-react": "^7.18.6",
		"@types/node": "^18.11.9",
		"@typescript-eslint/eslint-plugin": "^5.51.0",
		"@typescript-eslint/parser": "^5.51.0",
		"eslint": "^8.33.0",
		"eslint-config-airbnb": "^19.0.4",
		"eslint-config-airbnb-typescript": "^17.0.0",
		"eslint-config-prettier": "^8.6.0",
		"eslint-config-wesbos": "^3.1.4",
		"eslint-plugin-eslint-comments": "^3.2.0",
		"eslint-plugin-html": "^7.1.0",
		"eslint-plugin-import": "^2.26.0",
		"eslint-plugin-jsx-a11y": "^6.6.1",
		"eslint-plugin-prettier": "^4.2.1",
		"eslint-plugin-react": "^7.31.11",
		"eslint-plugin-react-hooks": "^4.6.0",
		"eslint-plugin-typescript-sort-keys": "^2.1.0",
		"prettier": "^2.8.4",
		"prettier-plugin-packagejson": "^2.4.2",
		"tsup": "^6.6.3",
		"typescript": "^4.9.5"
  }
}


' >package.json


pnpm i

pnpm config set auto-install-peers true




pnpm exec tsc --init # Create a tsconfig.json file

echo '{
	"compilerOptions": {

		"target": "es2016",
		"module": "commonjs",
		"rootDir": "./src",
	    "outDir": "./dist",
		"esModuleInterop": true,
		"forceConsistentCasingInFileNames": true ,
        "strict": true,
		"noImplicitAny": true,
		"strictNullChecks": true,
		"skipDefaultLibCheck": true,
		"skipLibCheck": true
	}
}

' > tsconfig.json




mkdir src
touch src/index.ts

mkdir dist

touch .gitignore

echo 'node_modules
dist
' > .gitignore

touch .eslintrc
echo '{
	"parser": "@typescript-eslint/parser",

	"plugins": ["@typescript-eslint", "typescript-sort-keys"],

	"overrides": [
		{
			"files": ["*.ts", "*.tsx"], // Your TypeScript files extension

			"extends": [
				"wesbos/typescript",
				"eslint:recommended",
				"plugin:@typescript-eslint/recommended",
				"plugin:eslint-comments/recommended",
				"plugin:@typescript-eslint/recommended-requiring-type-checking",
				"plugin:@typescript-eslint/strict",
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


## Comment out the following lines to not push to github
git add .
git commit -m"First commit"
git branch -M main
git push -u origin main




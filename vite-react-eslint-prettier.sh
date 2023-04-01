#!/bin/bash

# install vite-plugin-eslint and eslint packages as well as eslint-config-react-app
npm install --save-dev eslint eslint-config-react-app vite-plugin-eslint

# initialize eslint configuration
npm eslint init

# create .eslintrc file that extends react-app
echo '{"extends": "react-app"}' > .eslintrc

# install prettier package and prettier extension for vscode
npm install --save-dev prettier
code --install-extension esbenp.prettier-vscode

# import eslint from vite-plugin-eslint in vite.config.js
echo "import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import eslint from 'vite-plugin-eslint';

export default defineConfig({
  plugins: [react(), eslint()],
});" > vite.config.js

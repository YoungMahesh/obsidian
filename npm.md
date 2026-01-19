#package-manager 
## basic commands npm
```bash
npm init -y     # create package.json file for your project
npm install <package-name>  # install a package
npm install <package-name> --save-dev  # save as development dependency

npm install     # install all packages written in package.json
npm run <command>                      # run package.json script

npm install <package-name> -g          # globally install packge
npm uninstall -g yarn                  # remove global packages

npm -v          # check current version

npm list -g --depth=0     # check globally installed packages on npm
```


## working

### `npx` vs `script-command`
```bash
# A. directly use npx in CLI
# what happens:
#   1. Uses local node_modules if present
#   2. Otherwise downloads a temporary copy
#   3. Does NOT rely on global installs
npx dotenvx encrypt


# B. create script in package.json and then execute that script
#   e.g. step1: create in package.json: "scripts": { "encrypt": "dotenvx encrypt" } 
#        step2: execute `npm run encrypt`
# what happens: 
#   1. Injects node_modules/.bin first
#   2. Uses local package if present
#   3. Falls back to global binary if local is missing
npm run encrypt
```


## npm update
- How Updates Are Handled
	- npm packages are defined as: `"react": "^18.3.1"`
		- e.g. in `18.3.1` - 18 == version , 3 == minor, 1 == patch
	- When running commands like npm update, npm evaluates these symbols to determine which versions of dependencies can be installed:
	- With Caret (^): If a newer minor or patch version exists within the allowed range, npm will update to that version.
	- With Tilde (~): Only patch updates are considered; if a newer patch version exists, it will be updated.
	- With No-Sign: No updates occur unless the specified version is changed in the configuration.
	- because of the system, `npm update` does not normally break app functionality

### update outdated
```bash
npm outdated # check list of packages which can be upgraded
npm update --save # upgrade node packages

# update spacific package latest version
npm i <package-name>@latest

# location of global node_modules
npm root -g
```

### check and update packages to latest version
```bash
npm install -g npm-check-updates

# Check for new versions
ncu

# Upgrade all dependencies in package.json
ncu -u

# Install the updated packages
npm install
```

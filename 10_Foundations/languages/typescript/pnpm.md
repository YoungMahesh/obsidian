[[node]]   [[npm]]

### basic commands
```bash
# install in dependencies
pnpm add <pkg>

# install in dev-dependencies
pnpm add <pkg> --save-dev

# move from dev-dependencies to dependencies
pnpm add <pkg> --save-prod
```

### install 
```bash
# https://pnpm.io/installation#using-npm
npm install -g pnpm@latest-10
which pnpm
```

### switch version

```bash
corepack prepare pnpm@<version> --activate
pnpm -v
```

## move project from npm to pnpm

1. remove `package-lock.json` and `node_modules`
```bash
rm -rf node_modules package-lock.json

# https://pnpm.io/package_json#engines
# set pnpm version in package.json.engines.pnpm 
```

2.  set version of pnpm in `package.json`
```json
{
  "engines": {
	"node": "24.11.1",
    "pnpm": "10.29.2"
  }
}
```

3. use pnpm while executing scripts
```bash
pnpm run dev
# instead of - npm run dev
```

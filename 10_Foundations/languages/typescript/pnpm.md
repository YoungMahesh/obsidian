[[npm]]
### install 
```bash
# https://pnpm.io/installation#using-npm
npm install -g pnpm@latest-10
which pnpm
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

#cli/env #encryption 

- https://dotenvx.com/

```bash
pnpm dotenvx get <variable-name> -f .env.dev -fk .env.keys
pnpm dotenvx decrypt -f .env.dev -fk .env.keys

# -------------------------------------------

pnpm install @dotenvx/dotenvx --save
pnpm which dotenvx

# set a single environment variable
pnpm dotenvx set <KEY> <value> -f [Filename]
# return a single environment variable
pnpm dotenvx get [KEY]
pnpm dotenvx get [KEY] -f [FileName]
# check env-variables availble to package.json-script
dotenvx run -f ./.env.dev -- env | grep DATABASE_URL

# convert .env file(s) to encrypted .env file(s)
pnpm dotenvx encrypt -f [FileName]
pnpm dotenvx encrypt -f .env.dev
# convert encrypted .env file(s) to plain .env file(s)
pnpm dotenvx decrypt -f [FileName]

# inject env variables in decrypted form to the cli command 
pnpm dotenvx run -f [envFileName] -- [CLI_Command]
pnpm dotenvx run -f ./.env.dev -- next dev

# define private key and then decrypt
export DOTENV_PRIVATE_KEY=abc123
pnpm dotenvx decrypt -f .env
```
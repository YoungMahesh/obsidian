https://mastra.ai/

### Setup

1. Set opencode go api key
   - Create `.env` file with content `OPENCODE_API_KEY=<api-key>`
2. Get list of model names/IDs for opencode-go
   - Execute: `node .agents/skills/mastra/scripts/provider-registry.mjs --provider opencode-go`
3. In `agent.ts` file, set value of model
   - e.g. `model: 'opencode-go/deepseek-v4.1-flash'`
4. Setup exa-search as web_search tool?

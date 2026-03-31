#AI/provider

## best plans
1. Minimax token plan - $10/month
	- not used yet
2. Opencode Go - $10/month
	- $60 worth of tokens per month for top chinese models
3. github copilot
	- claude models at affordable price
4. OpenAI Go - $8/month 
	- OpenAI codex - not used yet
5. antigravity
	- currently have quota limit issues
--- 

## [[github-copilot]]

## MiniMax 
- [$10 / month](https://platform.minimax.io/subscribe/token-plan)
	- 1500 model requests of Minimax M2.7 / 5 hours
	
## Google
### [gemini cli](https://github.com/google-gemini/gemini-cli)
- free 1000 requests per day for gemini 2.5 pro
	- can be used with kilo-code
- stores credentials at: `~/.gemini`
- Not using anymore, as I experienced slow responses
### [gemini assist](https://marketplace.visualstudio.com/items?itemName=Google.geminicodeassist)
- vscode extension
- quota and speed is probably same as gemini_cli
### antigravity
- VSCode-fork by Google
####  $20/month Google AI Pro pro plan:
- currently, this plan is available for free for Jio customers in India (for specific plans)
- Limited quota: 
	- 5 hour quota get consumed within 2 hours
	- many times, after first 5 hour quota, users need to wait for week to get next quota
	- Model credits
		- after limited quota is exhausted 'Model Credits ' can be used to continue use models
		- 1000 Model Credits per month
	- Check current quota
		- Click "Antigravity-setting" in bottom-right → Settings → Advanced Settings → Models → Model Quota
- Models available : 
	- set 1: Gemini 3.1 Pro (High), Gemini 3.1 (Low)
		- limited quota
	- set 2: Claude  sonnet 4.6 (thinking), Claude Opus 4.6 (thinking)
		- limited quota
	- set 3: Gemini Flash 3
		- almost unlimited quota

## opencode
- [with $10 go plan, you can use tokens of top models worth $60 tokens](https://opencode.ai/docs/go/#usage-limits)
	- [some users claim that models are heavily quantised](https://www.reddit.com/r/opencodeCLI/comments/1s40z4p/opencode_go_plan_is_genuinely_the_worst_coding/)
		- although, my experience was good with MiniMax m2.7 for nextjs app
		- [founder debunked this theory](https://x.com/thdxr/status/2038474676310028384)

## kilo code
- pay only for what you use
- buy prepaid credits with no expiry
- no service-fee during deposit
- one-time: free $5 for signup; free $20 credits for payment-verification (deposit $5)
## openrouter
- pay only for what you use
- buy prepaid credits with no expiry
- 5% service-fee during deposit (minimum $0.8)
- free models requests: 1000 / day
	- keep >$10 balance in account
	- can be used wit kilo-code and cline
## [[perplexity]]
- one-time: 1 year free pro version offer for Airtel-customers in India.

## groq
- free model requests: 14,400 request per day
- can be used with opencode

## Windsurf
- for limited time: unlimited swe-1 prompts
- unlimited swe-1 lite

## t3.chat
- with $8/month you get 1500 queries from almost all top AI models
	- you get only 100 queries/month from expensive models such as Claude 4.0 sonnet


## comparison

|                                                | openrouter | t3.chat | perplexity | google-gemini |
| ---------------------------------------------- | ---------- | ------- | ---------- | ------------- |
| Price                                          | credits    | $8      | $20        | $20           |
| branch-off chat                                | no         | yes     | no         | no            |
| almost all models                              | yes        | yes     | no         | no            |
| chat with multiple<br>models at once           | yes        | no      | no         | no            |
| unlimited claude                               | no         | no      | yes        | no            |
| API to use in <br>code-editor                  | yes        | no      | no         | yes           |
| web-search                                     | yes        | yes     | yes        | yes           |
| voice-chat                                     | no         | no      | yes        | yes           |
| free usage programs<br>for students/developers | yes        | no      | yes        | yes           |
| almost unlimited usage <br>with pro plan       | -          | yes     | yes        | yes           |

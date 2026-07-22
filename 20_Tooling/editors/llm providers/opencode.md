## Go plan
- [with $10 go plan, you can use tokens of top models worth $60 tokens](https://opencode.ai/docs/go/#usage-limits)
	- [some users claim that models are heavily quantised](https://www.reddit.com/r/opencodeCLI/comments/1s40z4p/opencode_go_plan_is_genuinely_the_worst_coding/)
		- [founder debunked this theory](https://x.com/thdxr/status/2038474676310028384)
		- I used both and does not detected any major difference


### Use API key of Go plan in other apps
- Reference: https://opencode.ai/docs/go/#endpoints
- Endpoint 1 (api-type: chat-completions): `https://opencode.ai/zen/go/v1/chat/completions`
	- supported models: 
		- glm-5.2
		- glm-5.1
		- kimi-k2.7-code
		- kimi-k2.6
		- deepseek-v4-pro 
		- deepseek-v4-flash
		- mimo-v2.5
		- mimo-v2.5-pro
- Endpoint 2 (api-type: messages): `https://opencode.ai/zen/go/v1/chat/completions`
	- Supported Models
		- minimax-m3
		- minimax-m2.7
		- minimax-m2.5
		- qwen3.7-max
		- qwen3.7-plus
		- qwen3.6-plus


Get [List of Models](https://opencode.ai/docs/go/#models) available:

```bash
curl https://opencode.ai/zen/go/v1/models \
  -H "Authorization: Bearer <go-plan-api-key>"
```

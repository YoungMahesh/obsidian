https://generalcompute.com
## pricing
- free $200 inference credit for Minimax M2.7

## setup for [[opencode_cli]]

1. Update opencode configuration
```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "general-compute": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "General Compute",
      "options": {
        "baseURL": "https://api.generalcompute.com/v1"
      },
      "models": {
        "minimax-m2.7": {
          "name": "MiniMax M2.7",
          "limit": { "context": 192000, "output": 32000 }
        },
        "deepseek-v3.2": {
          "name": "DeepSeek V3.2",
          "limit": { "context": 32000, "output": 32000 }
        }
      }
    }
  },
}
```

2. Update Opencode `auth.json`
```json
{
  "general-compute": {
    "type": "api",
    "key": "<key>"
  }
}
```
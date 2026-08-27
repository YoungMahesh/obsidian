### OpenCode LLM Setup

1. Settings -> LLM -> Add LLM profile / Edit existing profile -> Advanced:
```
Authentication: API Key
# custom model: openai/<model-id> ; openai for openai compatible models
Custom Model: openai/mimo-v2.5
# remove extra paths such as `/chat/completions` in `https://opencode.ai/zen/go/v1/chat/completions`
Base URL: https://opencode.ai/zen/go/v1
API Key: <api-key
```

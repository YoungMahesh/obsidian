
```bash
hermes # Start chatting

hermes sessions browse # searchable picker where you can filter sessions and press Enter to resume one

hermes setup # Configure API keys & settings
hermes setup model # Change model/provider
hermes setup terminal # Change terminal backend
hermes setup gateway # Configure messaging
hermes setup tools # Configure tool providers

hermes config # View/edit configuration
hermes config edit # Open config in editor
hermes config set <key> <value>
# Set a specific value
# Or edit the files directly:
# vi /root/.hermes/config.yaml
# vi /root/.hermes/.env

hermes gateway install # Install gateway service (messaging + cron)
hermes update # Update to latest versio


hermes uninstall
```

### Setup

Setup Telegram:
1. Execute `hermes gateway setup`
2. Select telegram
3. Open telegram-bot link given in output, and start the bot
4. Complete setup with done
5. In Telegram-bot, execute `/sethome`, so that - Cron jobs and cross-platform messages will be delivered in Telegram-bot.


### File system locations

Memories: `/data/.hermes/memories`
Config: `.hermes/config.yaml`
API Keys: `.hermes/.env`
Data: `.hermes/cron/, sessions/, logs/`
Code: `/usr/local/lib/hermes-agent`
Sessions: ``/data/.hermes/sessions/`

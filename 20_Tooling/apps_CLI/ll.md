`ll` is usually not a real command. On many Linux systems it's just a shell alias, for example: `alias ll='ls -alF'`
To check actual command behind it, use `alias ll` or `type ll`

--- 

Because it is not real command it does not work with `sudo`.
To use it with sudo use actual command like `sudo ls -alF <path>`

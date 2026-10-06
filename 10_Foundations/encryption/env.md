
### convert multi-line private key to single-line to provide as a value of .env variable

1. Store Github Github app private key in a file (key.pem):
```pem
"-----BEGIN RSA PRIVATE KEY-----
A5k7kr83608ZOKWp5yhe142V9SDrIXYuEVLtSjkCgYAH0opjFZ7oCEl+TAjmU94q
+SA9xoMgaim6k032qfFrkbkPyu/Ztx6tvHcFDUWHlVz1fTQ6hnZyqSKr02bLRQWf
+FNy5iNXFhqmRQNg/Jigtt/kRBSkAeLHeHCpzzOU9kivCGyGH+w=
-----END RSA PRIVATE KEY-----"
```

2. Execute:
- `awk` is a text-processing tool. It reads the input one line at a time and executes the code inside { ... }
- `$0` means the entire current input "line"
- `printf` prints the current line using the format string
- `%s` means a string, `\n` means new line, `\\n` means escape new-line
```bash
awk '{printf "%s\\n", $0}' key.pem
```

3. You will get output:
```txt
"-----BEGIN RSA PRIVATE KEY-----\nA5k7kr83608ZOKWp5yhe142V9SDrIXYuEVLtSjkCgYAH0opjFZ7oCEl+TAjmU94q\n+SA9xoMgaim6k032qfFrkbkPyu/Ztx6tvHcFDUWHlVz1fTQ6hnZyqSKr02bLRQWf\n+FNy5iNXFhqmRQNg/Jigtt/kRBSkAeLHeHCpzzOU9kivCGyGH+w=\n-----END RSA PRIVATE KEY-----"\n
```

4. Store it in .env file as value of variable:
```env
GITHUB_APP_PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----\nA5k7kr83608ZOKWp5yhe142V9SDrIXYuEVLtSjkCgYAH0opjFZ7oCEl+TAjmU94q\n+SA9xoMgaim6k032qfFrkbkPyu/Ztx6tvHcFDUWHlVz1fTQ6hnZyqSKr02bLRQWf\n+FNy5iNXFhqmRQNg/Jigtt/kRBSkAeLHeHCpzzOU9kivCGyGH+w=\n-----END RSA PRIVATE KEY-----"\n
```

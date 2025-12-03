#encryption 

## concept

### main key vs subkeys
- flags
	- sec (secret kye) = master key
	- ssb (secret sub key) = sub keys

In GPG(OpenPGP), subkeys are extra cryptographic keys attached to your main key that let you separate identity from daily usage. 

- Main Key
	- used to
		- prove your identity
		- create revoke subkeys
	- should be kept offline (cold storage)
	- rarely used
- Subkeys
	- used for everyday tasks like
		- encrypting files
		- signing commits
		- authenticating to servers
		
You typically carry subkeys on your laptop or hardware key, not master key

### Purpose of subkeys
- better security
	- If your laptop is hacked; attacker can steal subkeys; you can revoke or replace subkeys without losing identity
- easier rotation
	- expire subkeys regularly; replace compromised subkeys; keep same public identity forever
- hardware support
	- security devices like YubiKey can store only subkeys not master key

### key flags
- S - sign data (like git commits)
- E - encrypt data
- A - Authenticate (SSH login)
- C - certify (master key only)


## usage

```bash
gpg --gen-key  # generate new key
gpg --list-keys # list public-addresses of public-keys stored on machine 
gpg --list-secret-keys # list public-addresses of secret-keys stored on machine
gpg --delete-keys <public_address> # delete public key stored on machine
gpg --delete-secret-keys <public_address> # delete secret key stored on machine 
gpg --edit-key <gpg-public-key> # remove key expiration
>expire      # `>` represents you are in gpg cli
>0   (for never expire)
>save

# ------------ encrypt and decrypt ------------------------------
# create a new file named `ssh1.zip.zip` by encrypting `ssh1.zip.gpg` file
gpg -e -r <gpg_public_key> ssh1.zip  # -e==encrypt, -r==recipient

# this will only work if you have gpg_private_key (public_key of which is used to encrypt the file) stored on machine
gpg -d -o ssh2.zip ssh1.zip.gpg  # -d==decrypt, -o==output 
``

# ------------ export and import ------------------------------
# export from machine 1
gpg --output public.gpg --armor --export <gpg-public-key>
# --output  name of exported file
# --armor   ascii armored output
# --export  export-keys
gpg --output private.pgp --armor --export-secret-key <gpg-public-key>

# import on machine 2
gpg --import public.pgp  # if you have imported private-key, public-key will be generated automatically
gpg --import private.pgp
# if error in importing private-key as follows:
# gpg: key <public-key>: error sending to agent: Permission denied
# gpg: error building skey array: Permission denied
# gpg: error reading 'private.pgp': Permission denied
# gpg: import from 'private.pgp' failed: Permission denied
# then import as
gpg --import --pinentry-mode loopback  private.pgp

# gpg may not work immediately if you imported in newly created user-account, execute following command to make it work
# you may encounter some error like: gpg: decryption failed: No secret key
script /dev/null

# -------------- enable trust -------------------------
gpg --edit-key <KEY_ID>
gpg> trust            
# You will be asked to select the trust level from the following:
# 1 = I don't know or won't say
# 2 = I do NOT trust
# 3 = I trust marginally
# 4 = I trust fully
# 5 = I trust ultimately
# m = back to the main menu
# I selected 5 since I created the key so of course I trust it ultimately :). It will ask you to confirm your decision:
Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y
# After confirming, quit with:
gpg> quit
```


## errors

### fix: encryption failed: Unusable public key
```bash
# go inside gpg-program and list keys
gpg --list-keys
gpg --edit-key <gpg-master-key-address>

gpg>list
```
#### cause 1: subkey does not exist

#### cause 2. subkey is expired
```bash
gpg --edit-key <gpg-master-key-address>
gpg>list

# select key using 0-based indexing
# select first key
gpg>key 0
# select second key
gpg>key 1

# then run:
gpg>expire
# select extention period by following prompted instructions

# Save the changes by typing:
gpg>save
```

#### cause 3. subkey does not have enough trust
- Error: gpg: `<key-id>`: There is no assurance this key belongs to the named user
```bash
gpg --edit-key <gpg-master-key-address>
gpg>list

# select key using 0-based indexing, 1 = second-key
gpg>key 1

# open trust
gpg>trust
# you will see menu similar like this:
# Please decide how far you trust this user to correctly verify other users' keys
# (by looking at passports, checking fingerprints from different sources, etc.)
# 
#   1 = I don't know or won't say
#   2 = I do NOT trust
#   3 = I trust marginally
#   4 = I trust fully
#   5 = I trust ultimately
#   m = back to the main menu
# 
# Your decision?
gpg>5

gpg>save
```


---


- GnuPG (GNU Privacy Gaurd) is a complete and free implementation of the OpenPGP standard defined by PGP

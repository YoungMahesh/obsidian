
## What is GPG?

**GPG (GNU Privacy Guard)** implements the OpenPGP standard.
It lets you:

* 🔐 **Encrypt** files/messages
* ✍️ **Sign** files/messages (prove authenticity)
* 🔑 **Authenticate** (e.g., SSH login, git commit signing)

Every identity (like `mahesh@example.com`) has a **keypair**:

* **Public key** → shared with others
* **Private key** → kept secret


## The Four Capabilities of keys

In GPG, every key (both your primary key and its subkeys) is assigned specific **capabilities**. These flags define exactly what that key is permitted to do. When you run `gpg --list-keys`, you will see these letters—**C, S, E, and A**—next to the key ID.

A standard GPG setup usually looks like this:

| Key Type        | Capabilities | Why?                                |
| --------------- | ------------ | ----------------------------------- |
| **Primary Key** | **[C]**      | To manage the identity and subkeys. |
| **Subkey 1**    | **[S]**      | To sign emails and files.           |
| **Subkey 2**    | **[E]**      | To decrypt messages sent to you.    |
| **Subkey 3**    | **[A]**      | To log into servers via SSH.        |

#### 1. Certify (C)

This is the "Administrative" power of your GPG identity. It is almost always reserved for your **Primary (Master) Key**.

* **What it does:** It allows the key to "vouch" for other keys. You use it to create subkeys, add new email addresses (User IDs) to your profile, or sign someone else's public key to show you trust them.
* **Security Tip:** Because it controls your entire identity, many power users keep the "C" key on an offline USB drive and only use it once or twice a year.

#### 2. Sign (S)

This is for **Integrity**. It proves that a piece of data came from you and hasn't been tampered with.

* **What it does:** When you "sign" a file, a document, or an email, this capability creates a digital fingerprint. If even one character in the file changes, the signature becomes invalid.
* **Usage:** Daily communication, signing git commits, or verifying software releases.

#### 3. Encrypt (E)

This is for **Privacy**. It ensures that only the intended recipient can read the message.

* **What it does:** This capability allows a key to be used to scramble data so that only the corresponding private key can unscramble it.
* **Note:** You use *someone else's* "E" key to send them a secret message; they use their own "E" key to decrypt it.

#### 4. Authenticate (A)

This is for **Identity Verification**, usually for logging into services.

* **What it does:** It is most commonly used for **SSH** (Secure Shell). Instead of using a separate SSH key to log into a server, you can use your GPG key to prove who you are.
* **Usage:** Logging into remote servers or signing into certain web portals.

---


```bash
# You can check which flags are active on your own keys by running:
gpg --list-keys --with-colons | grep '^pub\|^sub'
# OR
gpg -K
# In the output, you will see strings like `[SC]` (Sign and Certify) or `[E]` (Encryption only) next to the creation date.
```





## Master Key (Primary Key)

The **master key** is the **root identity key**. It is only key which that holds the Certify capability

Its main role is **managing trust**, not daily work. Hence it is rarely used.

Typical responsibilities:

* ✍️ **Certify other keys** (sign other people's public keys)
* 🔑 **Create and sign or revoke subkeys**
* 🪪 **Represent/Prove your identity**


### Important security practice

Most people **keep the master key offline** (USB, hardware token, etc).

Why?: If your laptop gets hacked, the attacker should **not gain control of your identity**.

---

## Subkeys

Subkeys are **child keys created by the master key**. They are cryptographically signed by the master key.

You typically carry subkeys on your laptop or hardware key, not master key.

```
Master key (certification only)
│
├── Subkey A (signing)
├── Subkey B (encryption)
└── Subkey C (authentication)
```

They perform operational tasks. Common subkeys:

| Type                  | Purpose                |
| --------------------- | ---------------------- |
| Encryption subkey     | encrypt messages/files |
| Signing subkey        | sign files/git commits |
| Authentication subkey | SSH login              |

Software verifies:
✔ subkey signed by master
✔ master belongs to identity

Then it trusts the subkey.


### How to print/identify keys

```bash
gpg --list-secret-keys

sec   rsa4096 2024-01-01 [C]
      ABCDEF1234567890
uid   Mahesh <mahesh@example.com>

ssb   rsa4096 2024-01-01 [S]
ssb   rsa4096 2024-01-01 [E]


# In above output
"sec = secret master key"
"ssb = secret subkey"
```

---

### Why Use Subkeys?

Without subkeys: Single key does everything.

If stolen → **your entire identity is compromised**.

With subkeys:

```
Master key (offline)
│
└─ Subkey (daily use)
```

If subkey is stolen:

* revoke subkey
* create new subkey
* master key still safe

So the **damage is limited**.

### Revocation Example

Suppose your laptop gets stolen. Your signing subkey is compromised.

You:
- revoke signing subkey
- create new signing subkey
- publish updated public key

Your **master key identity remains valid**.

---

### 1. Can a single subkey perform [S], [E], and [A]?

**Yes.** You can absolutely create a single subkey that holds all three capabilities simultaneously.

* **How it works:** When generating a subkey (using `gpg --expert --edit-key`), you can manually toggle the flags for Sign, Encrypt, and Authenticate.
* **Why people do this:** It simplifies key management if you are moving your keys to a physical security token (like a YubiKey) that has limited "slots" for subkeys.
* **The Downside:** If that one subkey is compromised, your ability to sign, your private messages, and your SSH access are **all** compromised at once. Most GPG users prefer separate subkeys so they can revoke only the "Sign" key while keeping the "Encrypt" key, for example.

### 2. Can a Master Key perform these actions directly?

**Yes.** A Master Key (the Primary Key) is technically capable of performing all four actions (**C, S, E, A**).

* **The Default Setup:** When you first create a GPG key, GPG usually creates a Primary Key with **[SC]** (Sign and Certify) and a Subkey with **[E]** (Encrypt).
* **Direct Action:** You can use your Master Key to sign files or emails directly. However, it is **highly discouraged** in modern GPG practice.

---

### Why the "Master" shouldn't do everything

The separation of Master and Subkeys is the "gold standard" for GPG security for one major reason: **Revocation.**

| Scenario             | If using Master Key for everything                                                                  | If using Subkeys                                                                                               |
| -------------------- | --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| **Laptop is Stolen** | Your entire identity is gone. You must create a new key and ask everyone to trust you from scratch. | You use your "Master" (kept safe at home) to **revoke** only the stolen subkeys. Your identity remains intact. |
| **Web of Trust**     | If you lose the key, you lose all the "signatures" and reputation you've built over years.          | Your reputation is tied to the Master Key, which stays offline and safe.                                       |
| **Security**         | The Master Key must be "unlocked" frequently for daily tasks, increasing exposure.                  | The Master Key stays encrypted/offline; only the "disposable" subkeys are exposed to daily risks.              |


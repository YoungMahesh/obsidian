In the world of [[GPG]] (GNU Privacy Guard), a **keyserver** acts as a centralized, public directory for OpenPGP public keys. Think of it like a global, digital phonebook for encryption keys.

### What is a Keyserver?

A keyserver is a networked database that allows users to store, share, and retrieve public keys. Because GPG relies on **Asymmetric Encryption**, you need someone's *public* key to send them an encrypted message or to verify their digital signature. The keyserver provides a way to find that key without having to ask the person directly.

---

### The Purpose of a Keyserver

The primary goals of a keyserver are **accessibility**, **distribution**, and **verification**.

#### 1. Public Distribution

Manually sending your public key to every person you know is inefficient. By "uploading" or "pushing" your key to a keyserver, you make it available to anyone in the world. They can simply search for your name or email address to find it.

#### 2. Building the Web of Trust

GPG uses a decentralized [[web-of-trust]] rather than a central authority. When you sign someone else’s key to vouch for their identity, you can upload that signature to a keyserver. This allows others to see who has verified that specific key, helping them decide if they should trust it.

#### 3. Key Revocation

If your private key is ever stolen or lost, you need to tell the world to stop using the associated public key. You do this by uploading a **Revocation Certificate** to the keyserver. 
Once a master key is revoked, it cannot be "un-revoked" or used again for its original purpose. 
In the GPG framework, revocation is designed to be a permanent, one-way cryptographic statement. Think of it like a "kill switch." 
Once that signal is sent and synchronized, the key is considered compromised or invalid by anyone who receives the update.

#### 4. Synchronization

Most modern keyservers are part of a global pool (like the SKS Keyserver pool or `keys.openpgp.org`). When you upload a key to one server, it eventually synchronizes with others. This ensures that your key is redundant and accessible even if one server goes down.

---

### How it Works in Practice

When using GPG in your terminal (such as on Ubuntu), you interact with keyservers using commands like these:

* **To send your key:** `gpg --keyserver hkps://keys.openpgp.org --send-keys [YOUR_KEY_ID]`
* **To find someone else's key:** `gpg --keyserver hkps://keys.openpgp.org --search-keys [USER_EMAIL]`

When you "export" and "send" your key to a keyserver, you aren't just sending the Master Key; you are sending a Public Key Block. This block includes:
- The Master Public Key (used for certifying other keys).
- All Public Subkeys (usually used for Encryption, Signing, or Authentication).
- User IDs (your name and email).
- Signatures (from yourself and others).
When someone fetches your key from a keyserver, their GPG client receives the whole bundle.

---
### A Note on Privacy

**Immutable History**: Keyservers are designed to be append-only. You cannot "delete" a key from a keyserver because doing so would allow an attacker to delete your valid key and replace it with a fake one.

**The Revocation is an Update**: When you "delete" a key in the context of a keyserver, what you are actually doing is uploading a Revocation Certificate. The keyserver keeps your old public key but attaches the "Revoked" flag to it.

**Searchability**: If someone searches for your email address on a keyserver, they will still see your old key, but it will be clearly marked as [REVOKED]. This is actually a security feature—it prevents people from accidentally using an old, potentially compromised key.

---

### keys.openpgp.org

On the keys.openpgp.org server, an email address can be associated with only one single key at a time. This is a specific design choice that sets this server apart from older, legacy keyservers (like the now-defunct SKS pool or pgp.mit.edu).

1. **The "Single Key" Rule**
When you verify an email address on keys.openpgp.org, that verification is tied to a specific PGP key fingerprint.
Replacement Policy: If you generate a new key and verify the same email address for it, the server will automatically un-verify the previous key for that address.
One Result: When someone searches for your email, the server will only return the most recently verified key.

2. **Why do they do this?**
Older keyservers often returned a long list of keys for a single email (many of which were old, expired, or lost), leaving the sender to guess which one to use. This "identity clutter" was a major usability hurdle.
Discovery: By returning only one key, the server ensures that a sender always gets the "current" valid key for that person.
Spam Prevention: It prevents attackers from uploading thousands of fake keys for your email address to "poison" your identity.

3. **What happens to the "Non-Identity" data?**
While the server only links your email/identity to one key, it still technically "stores" the cryptographic material of older keys you've uploaded—it just won't show them in an email search.
Search by Fingerprint: If someone has the exact Fingerprint or Key ID of your old key, they can still download the technical data (like revocation certificates) even if it's no longer linked to your email.

The **Web of Trust (WoT)** is a decentralized trust model used by PGP, [[GPG]], and other OpenPGP-compatible systems to establish the authenticity of the binding between a public key and its owner.
The Web of Trust relies on individual users to vouch for one another.

---

## How The "Vouching" Process works

The core of the Web of Trust is the **digital signature**. When you sign someone else's public key, you are digitally asserting: *"I have verified that this public key belongs to this person."*

1. **Key Signing:** If you meet a colleague and verify their identity (perhaps by checking a photo ID), you can sign their public key with your private key.
2. **Certification:** Your signature is then attached to their public key. When they share their key with others, your signature goes with it.
3. **Trust Accumulation:** If a third party trusts *you*, and they see *your* signature on the colleague's key, they can safely assume that key is authentic without having to meet the colleague personally.

When you sign someone else's GPG key, that signature is not stored in a central database or a hidden system file. Instead, the signature is **appended directly to the public key certificate** of the person you are signing.

A GPG public key is not just a single string of characters; it is a collection of "packets." 
When you sign a key,  you are signing their Master Key, specifically, the primary **User ID (UID)** packet associated with that Master key. 
Your signature becomes a new packet attached immediately after that UID.


List signatures command:
```bash
gpg --list-sigs [KeyID]
```

This will show the primary key, the UID, and a list of every key (including yours) that has issued a signature for that UID.


---

## Degrees of Trust

GPG distinguishes between **validity** (is the key authentic?) and **trust** (how much do I trust this person to sign others' keys?). You usually assign one of these levels to people in your keyring:

* **Unknown:** Nothing is known about the owner's judgment.
* **None/Untrusted:** You do not trust this person to verify others.
* **Marginal:** You somewhat trust this person's judgment. (Usually, GPG requires **three** marginal signatures to consider a new key "valid").
* **Full:** You fully trust this person to verify others. (Only **one** full signature is needed to make a new key "valid").
* **Ultimate:** Reserved for your own keys.


---

## The Downside: Privacy and Complexity

The Web of Trust is powerful but has largely fallen out of favor for casual users due to:

* **Metadata Leaks:** Since signatures are public, anyone can look at a public key server and map out exactly who you know and who you trust, creating a massive social graph of your relationships.
* **Complexity:** It requires users to understand "key signing parties" and fingerprint verification, which has a steep learning curve compared to modern end-to-end encrypted apps like Signal or WhatsApp.






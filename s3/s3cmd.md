Popular CLI tool to manage S3-compatible storage. People use s3cmd although AWS CLI exists because:
- existed long before AWS CLI to manage s3 storage
- AWS CLI is bloated as it created to manage whole AWS infrastructure, while s3cmd is lightweight as it is created only for s3

Install:

```bash
sudo apt install s3cmd
```

Configure:

```bash
s3cmd --configure
```

List buckets:

```bash
s3cmd ls
```

---


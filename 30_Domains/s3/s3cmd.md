
> 🧠 S3 (and SeaweedFS S3) is **object storage** → “directories” are just prefixes, not real folders.

Popular CLI tool to manage S3-compatible storage. People use s3cmd although AWS CLI exists because:

- existed long before AWS CLI to manage s3 storage
- AWS CLI is bloated as it created to manage whole AWS infrastructure, while s3cmd is lightweight as it is created only for s3

Install:

```bash
sudo apt install s3cmd
```

Configure file `~/.s3cfg`:

Here we are considering object-storage provider is seaweedfs docker container
```bash
[default]
# Your custom credentials from s3.json
access_key = <access-key>
secret_key = <secret-key>

# Point to your Docker container
host_base = localhost:8333
host_bucket = localhost:8333

# SeaweedFS specific settings
use_https = False
signature_v2 = False
```


> Renaming bucket or it's content is not possible, as path of file is the key of the file, to achieve same result as rename you have copy content to new path and then delete old path
## Manage Buckets
```bash
# create bucket; mb = make bucket
s3cmd mb s3://app1

# remove contents of bucket
s3cmd del -r s3://app1
# remove empty bucket
s3cmd rb s3://app1

# List bucket
s3cmd ls
# output: 
# <timestamp>  s3://<bucket-name>
```

---
## Manage bucket content:
### Upload Files:
```bash
# upload single file
s3cmd put file.txt s3://app1/
s3cmd put file.txt s3://app1/docs/

# upload directory
s3cmd put -r myfolder s3://app1/
```

### List Files
```bash
s3cmd ls s3://<bucket-name>
# output:
# DIR  s3://app1/dir1/
# DIR = directory

# don't forget slash '/' at end to list contents of directory
s3cmd ls s3://<bucket-name>/<directory-name>/

# -r == --recursive
s3cmd ls s3://app1/ -r
```

### Copy Files
```bash
# copy single file
s3cmd cp s3://app1/old-name.txt s3://app1/new-name.txt

# copy directory
s3cmd cp --recursive s3://app1/old-folder/ s3://app1/new-folder/
```

### Download files
```bash
# single file
s3cmd get s3://app1/file.txt

# entire directory
s3cmd get -r s3://app1/docs/
```

### Delete files
```bash
# Delete a file
s3cmd del s3://app1/file.txt

# delete a directory/prefix
s3cmd del -r s3://app1/docs/
```
### Sync directory
```bash
# upload local -> bucket
s3cmd sync myfolder/ s3://app1/myfolder/

# download bucket -> local
s3cmd sync s3://app1/myfolder/ ./myfolder/
```


### Setup

1. create S3 config file - `s3.json`
```json
{
  "identities": [
    {
      "name": "<name>",
      "credentials": [
        {
          "accessKey": "<access-key>",
          "secretKey": "<secret-key>"
        }
      ],
      "actions": ["Admin"]
    }
  ]
}
```


2. Run docker container
```yml
services:
  sWeed:
    image: chrislusf/seaweedfs:4.15
    container_name: cWeed
    ports:
      - "8333:8333"   # S3 API Port
      - "127.0.0.1:9333:9333"   # Master UI port (Only accessible from your computer)
      - "127.0.0.1:18080:18080" # Filer UI port (Only accessible from your computer)
    volumes:
      - vWeed:/data
      # :ro = read-only flag; application inside container cannot change read-only flies
      - ./s3.json:/etc/seaweedfs/s3.json:ro
    # "-s3" = enable the S3 gateway
    command: 'server -dir="/data" -s3 -s3.config=/etc/seaweedfs/s3.json'

volumes:
  vWeed:
    name: vWeed
```


3. Browse using [[rclone]] v1.74.4
	- With Rclone you can browse using both terminal and GUI
```conf
[local-weed]
type = s3
provider = SeaweedFS
access_key_id = <access-key-id>
secret_access_key = <secret-access-key>
endpoint = http://localhost:8333
acl = private
```


3. Browse using [[s3cmd]] v2.4.0 
```s3cfg
# create file at ~/.s3cfg with content:

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
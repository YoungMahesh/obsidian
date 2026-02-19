#cli/file-manipulation 

```bash
sudo apt install zip unzip

# -r = recursive
zip -r <zip-file-name>.zip <directory-to-zip>

# zip without compression, -0 = no compression 
# files zipped with no-compression are faster to zip and unzip
zip -r -0 <file-name>.zip <directory>

# unzip files
# command is same whether the ZIP file was created with or no compression
unzip <file-name>.zip

# add timestamp
zip -r folder_$(date +%Y%m%d_%H%M%S).zip folder
# output: folder_20250828_162230.zip
zip -r folder_$(date +%Y-%m-%d_%H-%M-%S).zip folder
# output: folder_2025-08-28_16-23-15.zip

# suppress output logs using: `> /dev/null`
zip -r folder_$(date +%Y-%m-%d_%H-%M-%S).zip folder > /dev/null

```


## unzip

```bash 
sudo apt install unzip

```
#cli/fetch

### Download file

```bash
curl https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png -o pokemon2.png # -o = output
# -L = Follow HTTP redirects.
#   GitHub release URLs often respond with something like:
#     HTTP/1.1 302 Found
#     Location: https://objects.githubusercontent.com/...
#   Without -L, curl stops after receiving the redirect and won't download the actual file.
#   With -L, curl automatically follows the redirect until it reaches the real file.
# -o = Save the downloaded data to a file.
#   Without -o, curl writes the response to stdout (your terminal).
#   curl https://example.com - prints the webpage in your terminal.
#   Using -o: curl -o page.html https://example.com, creates: page.html
curl -L \
    -o /tmp/nvim.tar.gz \
    "https://github.com/neovim/neovim/releases/download/v0.12.3/nvim-linux-x86_64.tar.gz"


```

### HTTP requests
```bash
# keywords and flags
-H   # set header of the request
-i              # get response including headers
-o file1.txt    # write response in "file1.txt" file
--data "@file2.txt"  # send data inside 'file2.txt'
-X GET          # HTTP request type, X POST, X PUT, X DELETE
\       # escape sign, use this before new-line

# example: GET request
curl localhost:3000    # send GET request to 'http://localhost:3000'

# example: POST request with json-data
curl  -H "Content-Type: application/json" -H "foo:bar" \
  -X POST \
  --data '{"username":"xyz","password":"xyz"}' \
  http://localhost:3000/api/login

## example: send x-www-form-urlencoded data
curl --header "Content-Type: application/x-www-form-urlencoded" --data 'email=maya@gmail.com&username=maya' http://localhost:3000/api/login

# example: Upload Files
curl -X POST -F file=@myfile \
-u "PROJECT_ID:PROJECT_SECRET" \
"https://ipfs.infura.io:5001/api/v0/add"

> {
      "Name":"ipfs_file_docs_getting_started_demo.txt",
      "Hash":"QmeGAVddnBSnKc1DLE7DLV9uuTqo5F7QbaveTjr45JUdQn",
      "Size":"44"
  }
```


### Documentation: 
`man curl`
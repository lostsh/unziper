# How to use

To unzip all .zip in the current dir
`./run-unziper.sh`

To unzip all .zip in a specific dir
`./run-unziper.sh /home/directory/to/zip/files`

# Dependency
> docker

# Note
The wrapper handle the image build and deletion by itself.


# Other options : 
With python3: 
```python3
import zipfile

with zipfile.ZipFile('test.zip', "r") as z:
  z.extractall("/home/user/directory")
```

With java:
```bash
jar xvf file.zip
```

# Generating certs

Create new certs with the pki tool in taskserver git repo.

```
cd ~/workspace/github.com/GothenburgBitFactory/taskserver/pki
sed 's%generate.client client%generate.client joe_smith% pki/generate
# then update pki/vars
./generate

```

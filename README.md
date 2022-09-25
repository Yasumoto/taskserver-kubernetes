# Taskserver in Kubernetes

Refactored from https://github.com/yhaenggi/taskserver-kubernetes

See `./apply.sh` for the setup

## Certbot

The `99-certbot-nginx.yaml` file sets up nginx so you can set the
webroot during a certbot run. DO NOT use it, it's a starting place
to figure out how to work with Let's Encrypt certs.

## Renewal

Re-run the github.com/GothenburgBitFactory/taskserver/pki/generate
script, then copy `*.pem` into `./ssl`. Re-run `./apply.sh`; and
make sure you `kubectl delete pod --nameserver taskserver <pod>`!
Then copy `*.pem` into the `~/.task` dirs on any host you need to
sync! Note it should also include your profile key.

# DenyHosts

Docker container with denyhosts taken from https://github.com/adriel/denyhosts-docker and updated a little bit with more modern python, latest version of denyhosts and other bits.

## Usage

### Debian / Ubuntu

```
docker run -d \
	--name DenyHosts \
	--restart=always \
	-v /var/log/auth.log:/var/log/auth.log:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	boxrick/denyhosts-docker
```

### CentOS

```
docker run -d \
	--name DenyHosts \
	--restart=always \
	-v /var/log/secure:/var/log/secure:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	boxrick/denyhosts-docker
```

### Using your own config file

Overwrite `denyhosts.conf` with your own settings:

```
docker run -d \
	--name DenyHosts \
	--restart=always \
	-v /var/log/secure:/var/log/secure:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	-v /your/location/denyhosts.conf:/etc/denyhosts.conf \
	boxrick/denyhosts-docker
```

## docker-compose

Included in this repo
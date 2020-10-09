# Certbot + Cloudflare + Docker
This repo contains all you need to generate Let's Encrypt certificates using standalone certbot running inside docker.
You could use [oficial certbot docker images](https://hub.docker.com/r/certbot/certbot/) but that is only available for amd64, if you have other architecture you are out of luck... I used this on [ODROID XU4](https://www.hardkernel.com/shop/odroid-xu4-special-price/) ARMv7 but it can work anywhere were [python docker base image](https://hub.docker.com/_/python) works. 

## Prerequsites
- Docker, could be installed with `sudo apt install docker.io`
## Usage

Checkout this repository somewhere on your machine and move to it.
```bash
$ git clone https://github.com/aformusatii/docker-certbot.git
cd docker-certbot
```

Optionally you can edit Dockerfile to customize how certbot is running.

Build your custom certbot image.
```sh
$ sudo docker build -t mycertbot .
```

Create `cloudflare.ini` file with api token in some directory (ex: `/tmp/certbot`), see [documentation](https://certbot-dns-cloudflare.readthedocs.io/en/stable/)

Generate the certificate.
```sh
$ mkdir /tmp/certbot
$ sudo docker run --rm -it -v /tmp/certbot:/opt/certs pythontest --email youremail@email-domain.com -d *.yourdomain.com
```

You should now have certificates in `/tmp/certbot/out/live` folder.


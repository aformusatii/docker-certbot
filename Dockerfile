FROM python:latest

RUN apt-get update 
RUN apt-get -y install certbot 
RUN pip install certbot-dns-cloudflare

RUN mkdir -p /opt/certs

VOLUME /opt/certs

# RUN while true; do sleep 3; echo "1"; done;

# CMD [ "python", "-V" ]
ENTRYPOINT [ \
  "certbot", \
  "certonly", \ 
  "-n", \
  "-v", \
  "--no-self-upgrade", \ 
  "--dns-cloudflare", \
  "--dns-cloudflare-credentials", \
  "/opt/certs/cloudflare.ini", \ 
  "--work-dir", \
  "/opt/certs/", \
  "--logs-dir", \
  "/opt/certs/", \
  "--config-dir", \
  "/opt/certs/out" \
  "--agree-tos", \
  "--preferred-challenges=dns" \
]

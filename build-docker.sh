docker build -t web_easy_bpd .
docker run  --name=web_easy_bpd --rm -p5003:8000 -it web_easy_bpd

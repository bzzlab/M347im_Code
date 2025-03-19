### Steps for Demo-03
1. Build a dockerfile with tag -t
```docker build -t m347_i2 -f Dockerfile2 .```//??
2. List images
```docker image ls```//??
3. Run image with and name it m347_c1
```docker run -itd --rm --name m347_c2 m347_i2```//??
4. Start bash-shell in container
```docker exec -it m347_c2 bash```//??



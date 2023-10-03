FROM ethereum/client-go:latest

ARG ACCOUNT_PASSWORD

COPY genesis.json /tmp
COPY password.txt /tmp
COPY node-privkey /tmp

RUN geth init /tmp/genesis.json \
    && rm -f ~/.ethereum/geth/nodekey \
    && echo ${ACCOUNT_PASSWORD} > /tmp/password \
    # && geth account new --password /tmp/password \
    && geth account import --password /tmp/password /tmp/node-privkey 
    # && rm -f /tmp/password

ENTRYPOINT ["geth"]

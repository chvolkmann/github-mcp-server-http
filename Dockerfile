
FROM ghcr.io/github/github-mcp-server:0.9.1 AS github-mcp-server

FROM node

RUN npm install -g mcp-proxy

COPY --from=github-mcp-server /server/github-mcp-server /bin/github-mcp-server

EXPOSE 4444
ENTRYPOINT ["mcp-proxy", "--port", "4444", "github-mcp-server", "stdio"]

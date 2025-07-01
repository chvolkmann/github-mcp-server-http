ARG GITHUB_MCP_SERVER_VERSION=0.6.0

FROM ghcr.io/github/github-mcp-server:${GITHUB_MCP_SERVER_VERSION} AS github-mcp-server

FROM node

RUN npm install -g mcp-proxy

COPY --from=github-mcp-server /server/github-mcp-server /bin/github-mcp-server

EXPOSE 8000
ENTRYPOINT ["mcp-proxy", "--port", "8000", "github-mcp-server", "stdio"]

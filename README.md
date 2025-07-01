# GitHub MCP Server with Streamable HTTP+SSE Support

This is a simple Docker image for providing [Github's MCP server](https://github.com/github/github-mcp-server) over HTTP. Both streamable HTTP and Server-Sent Events (SSE) are supported.

Github's MCP docker image currently only provides `stdio` transport for MCP, so this image uses [mcp-proxy](https://github.com/sparfenyuk/mcp-proxy) to expose the server over HTTP.

## Quickstart
Supply your `GITHUB_PERSONAL_ACCESS_TOKEN` as an environment variable to the container. 

docker-compose.yml
```yaml
services:
  github-mcp-server:
    image: ghcr.io/chvolkmann/github-mcp-server-http
    ports:
      # run on port 4444
      - 127.0.0.1:4444:8000
    environment:
      # supply in environment or .env
      GITHUB_PERSONAL_ACCESS_TOKEN: ${GITHUB_PERSONAL_ACCESS_TOKEN}
```

```bash
docker compose up -d
# http://localhost:4444/mcp
# http://localhost:4444/sse
```

or directly
```bash
docker run --rm -it -e GITHUB_PERSONAL_ACCESS_TOKEN -p 127.0.0.1:4444:4444 ghcr.io/chvolkmann/github-mcp-server-http
```

## Usage in IDE
Example `.vscode/mcp.json`:
```json
{
  "servers": {
    "github-mcp": {
      "url": "http://localhost:4444/mcp"
    }
  }
}
```

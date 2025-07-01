# GitHub MCP Server with Streamable HTTP+SSE Support

This is a simple Docker image for providing [Github's MCP server](https://github.com/github/github-mcp-server) over HTTP. Both streamable HTTP and Server-Sent Events (SSE) are supported.

Github currently only provides `stdio` transport for MCP, so this image uses [mcp-proxy](https://github.com/sparfenyuk/mcp-proxy) to expose the server over HTTP.

## Quickstart
Supply your `GITHUB_PERSONAL_ACCESS_TOKEN` as an environment variable to the container. 

docker-compose.yml
```yaml
services:
  github-mcp-server:
    image: github-mcp-server-http:latest
    ports:
      - 127.0.0.1:4444:8000  # run on port 4444
    environment:
      GITHUB_PERSONAL_ACCESS_TOKEN: ${GITHUB_PERSONAL_ACCESS_TOKEN}
```

```bash
# http://localhost:4444/mcp
# http://localhost:4444/sse
docker compose up -d
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

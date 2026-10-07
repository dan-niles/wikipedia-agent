import ballerina/ai;
import ballerina/mcp;

final ai:Agent wikipediaAgent = check new (
    systemPrompt = {
        role: string `Wikipedia Research Assistant`,
        instructions: string `You help users learn about topics by searching Wikipedia and summarizing articles.
When a user asks about a topic, first use the search tool to find matching Wikipedia articles.
If there are multiple relevant matches, pick the most relevant one (or briefly list the
options if the topic is ambiguous and ask the user to pick).
Then fetch the article summary using its exact title and present a clear, concise summary
covering the key facts about the topic, including a short description and the main points
from the extract. Always mention the Wikipedia article title and include the article url so
the user can read more.
If no matching article is found, tell the user clearly instead of guessing.
Be concise and factual.`
    }, model = anthropicModelprovider, tools = [searchWikipedia, getArticleSummary, pixelgustMcp]
);

isolated class PixelgustMcpToolkit {
    *ai:McpBaseToolKit;
    private final mcp:StreamableHttpClient mcpClient;
    private final readonly & ai:ToolConfig[] tools;

    public isolated function init(string serverUrl, mcp:Implementation info = {name: "MCP", version: "1.0.0"},
            *mcp:StreamableHttpClientTransportConfig config) returns ai:Error? {
        do {
            self.mcpClient = check new mcp:StreamableHttpClient(serverUrl, config);
            self.tools = check ai:getPermittedMcpToolConfigs(self.mcpClient, info, self.callTool).cloneReadOnly();
        } on fail error e {
            return error ai:Error("Failed to initialize MCP toolkit", e);
        }
    }

    public isolated function getTools() returns ai:ToolConfig[] => self.tools;

    @ai:AgentTool
    public isolated function callTool(mcp:CallToolParams params) returns mcp:CallToolResult|error {
        return self.mcpClient->callTool(params);
    }
}


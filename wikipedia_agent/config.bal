import ballerina/os;

configurable string ampAnthropicProviderAgentManagerUrl = os:getEnv("AMP_ANTHROPIC_PROVIDER_URL");
configurable string ampAnthropicProviderAgentManagerKey = os:getEnv("AMP_ANTHROPIC_PROVIDER_API_KEY");

configurable string pixelgustMcpUrl = os:getEnv("PIXELGUST_MCP_URL");
configurable string agentIdTokenUrl = os:getEnv("AMP_AGENTID_TOKEN_ENDPOINT");
configurable string agentIdScopes = os:getEnv("AMP_AGENTID_SCOPES");
configurable string agentIdClientId = os:getEnv("AMP_AGENTID_CLIENT_ID");
configurable string agentIdClientSecret = os:getEnv("AMP_AGENTID_CLIENT_SECRET");

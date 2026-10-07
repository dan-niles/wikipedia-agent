import ballerina/os;

configurable string ampAnthropicProviderAgentManagerUrl = os:getEnv("AMP_ANTHROPIC_PROVIDER_URL");
configurable string ampAnthropicProviderAgentManagerKey = os:getEnv("AMP_ANTHROPIC_PROVIDER_API_KEY");

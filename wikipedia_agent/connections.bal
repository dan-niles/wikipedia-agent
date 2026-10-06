import ballerina/http;
import ballerinax/ai.anthropic;

final http:Client wikipediaActionClient = check new ("https://en.wikipedia.org/w/api.php");

final http:Client wikipediaRestClient = check new ("https://en.wikipedia.org/api/rest_v1");

final anthropic:ModelProvider anthropicModelprovider = check new (anthropicAgentManagerKey, "claude-haiku-4-5", anthropicAgentManagerUrl + "/v1");

import ballerina/http;
import ballerina/mcp;

final http:Client wikipediaActionClient = check new ("https://en.wikipedia.org/w/api.php");

final http:Client wikipediaRestClient = check new ("https://en.wikipedia.org/api/rest_v1");

listener mcp:StreamableHttpListener mcpListener = check new (9090);

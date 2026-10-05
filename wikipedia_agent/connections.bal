import ballerina/ai;
import ballerina/http;

final http:Client wikipediaActionClient = check new ("https://en.wikipedia.org/w/api.php");

final http:Client wikipediaRestClient = check new ("https://en.wikipedia.org/api/rest_v1");

final ai:Wso2ModelProvider wikipediaAgentModel = check ai:getDefaultModelProvider();

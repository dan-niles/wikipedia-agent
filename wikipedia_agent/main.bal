import ballerina/ai;
import ballerina/http;

listener ai:Listener wikipediaAgentListener = new (listenOn = check http:getDefaultListener());

service /wikipedia\-agent on wikipediaAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        string stringResult = check wikipediaAgent.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}

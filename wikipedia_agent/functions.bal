import ballerina/ai;
import ballerina/url;

# Searches Wikipedia for articles matching a topic or query.
# + query - the topic or search query to look up on Wikipedia
# + maxResults - the maximum number of search results to return
# + return - a list of matching article titles with short snippets, or an error
@ai:AgentTool
isolated function searchWikipedia(string query, int maxResults) returns SearchResult[]|error {
    json response = check wikipediaActionClient->/.get(
        action = "query",
        list = "search",
        srsearch = query,
        srlimit = maxResults,
        format = "json"
    );
    WikipediaSearchResponse searchResponse = check response.cloneWithType();
    SearchResult[] results = [];
    foreach WikipediaSearchItem item in searchResponse.query.search {
        results.push({title: item.title, snippet: item.snippet, pageId: item.pageid});
    }
    return results;
}

# Fetches a summary of a specific Wikipedia article by its exact title, including
# a short description, an extract of the article text and a link to the full page.
# + title - the exact title of the Wikipedia article (as returned by the search tool)
# + return - the article summary, or an error if the article could not be found
@ai:AgentTool
isolated function getArticleSummary(string title) returns ArticleSummary|error {
    string formEncodedTitle = check url:encode(title, "UTF-8");
    string encodedTitle = re `\+`.replaceAll(formEncodedTitle, "%20");
    json response = check wikipediaRestClient->get(string `/page/summary/${encodedTitle}`);
    WikipediaSummaryResponse summaryResponse = check response.cloneWithType();
    string? pageUrl = summaryResponse?.content_urls?.desktop?.page;
    return {
        title: summaryResponse.title,
        extract: summaryResponse.extract,
        description: summaryResponse?.description,
        url: pageUrl
    };
}

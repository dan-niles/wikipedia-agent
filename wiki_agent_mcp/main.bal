import ballerina/mcp;

@mcp:ServiceConfig {
    info: {
        name: "Wikipedia MCP Server",
        version: "1.0.0"
    },
    options: {
        instructions: string `This server lets you search Wikipedia and fetch article summaries.
Use the searchWikipedia tool first to find matching articles for a topic, then use the
getArticleSummary tool with the exact title of the chosen article to get its summary.`
    }
}
service mcp:StreamableHttpService /mcp on mcpListener {

    # Searches Wikipedia for articles matching a topic or query.
    # + query - the topic or search query to look up on Wikipedia
    # + maxResults - the maximum number of search results to return
    # + return - a list of matching article titles with short snippets, or an error
    remote function searchWikipedia(string query, int maxResults) returns SearchResult[]|error {
        return searchWikipediaArticles(query, maxResults);
    }

    # Fetches a summary of a specific Wikipedia article by its exact title.
    # + title - the exact title of the Wikipedia article (as returned by the search tool)
    # + return - the article summary, or an error if the article could not be found
    remote function getArticleSummary(string title) returns ArticleSummary|error {
        return fetchArticleSummary(title);
    }
}

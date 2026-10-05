# A single Wikipedia search result matching a query.
public type SearchResult record {
    string title;
    string snippet;
    int pageId;
};

# A summary of a Wikipedia article/page.
public type ArticleSummary record {
    string title;
    string extract;
    string? description;
    string? url;
};

# A single search match item as returned by the MediaWiki action API.
type WikipediaSearchItem record {
    string title;
    string snippet;
    int pageid;
};

# The `query` section of the MediaWiki action API search response.
type WikipediaSearchQuery record {
    WikipediaSearchItem[] search;
};

# The MediaWiki action API response for a `list=search` query.
type WikipediaSearchResponse record {
    WikipediaSearchQuery query;
};

# A content URL entry in the Wikipedia REST API page summary response.
type WikipediaContentUrl record {
    string page?;
};

# The `content_urls` section of the Wikipedia REST API page summary response.
type WikipediaContentUrls record {
    WikipediaContentUrl desktop?;
};

# The Wikipedia REST API page summary response.
type WikipediaSummaryResponse record {
    string title;
    string extract;
    string description?;
    WikipediaContentUrls content_urls?;
};

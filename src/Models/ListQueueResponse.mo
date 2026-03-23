
import { type ApiV2010AccountQueue; JSON = ApiV2010AccountQueue } "./ApiV2010AccountQueue";

// ListQueueResponse.mo

module {
    // User-facing type: what application code uses
    public type ListQueueResponse = {
        queues : ?[ApiV2010AccountQueue];
        end : ?Int;
        first_page_uri : ?Text;
        next_page_uri : ?Text;
        page : ?Int;
        page_size : ?Int;
        previous_page_uri : ?Text;
        start : ?Int;
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListQueueResponse type
        public type JSON = {
            queues : ?[ApiV2010AccountQueue];
            end : ?Int;
            first_page_uri : ?Text;
            next_page_uri : ?Text;
            page : ?Int;
            page_size : ?Int;
            previous_page_uri : ?Text;
            start : ?Int;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListQueueResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListQueueResponse = ?json;
    }
}

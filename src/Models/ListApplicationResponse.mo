
import { type ApiV2010AccountApplication; JSON = ApiV2010AccountApplication } "./ApiV2010AccountApplication";

// ListApplicationResponse.mo

module {
    // User-facing type: what application code uses
    public type ListApplicationResponse = {
        applications : ?[ApiV2010AccountApplication];
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
        // Named "JSON" to avoid shadowing the outer ListApplicationResponse type
        public type JSON = {
            applications : ?[ApiV2010AccountApplication];
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
        public func toJSON(value : ListApplicationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListApplicationResponse = ?json;
    }
}


import { type ApiV2010AccountKey; JSON = ApiV2010AccountKey } "./ApiV2010AccountKey";

// ListKeyResponse.mo

module {
    // User-facing type: what application code uses
    public type ListKeyResponse = {
        keys : ?[ApiV2010AccountKey];
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
        // Named "JSON" to avoid shadowing the outer ListKeyResponse type
        public type JSON = {
            keys : ?[ApiV2010AccountKey];
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
        public func toJSON(value : ListKeyResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListKeyResponse = ?json;
    }
}

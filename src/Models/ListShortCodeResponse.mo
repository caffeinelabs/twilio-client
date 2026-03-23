
import { type ApiV2010AccountShortCode; JSON = ApiV2010AccountShortCode } "./ApiV2010AccountShortCode";

// ListShortCodeResponse.mo

module {
    // User-facing type: what application code uses
    public type ListShortCodeResponse = {
        short_codes : ?[ApiV2010AccountShortCode];
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
        // Named "JSON" to avoid shadowing the outer ListShortCodeResponse type
        public type JSON = {
            short_codes : ?[ApiV2010AccountShortCode];
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
        public func toJSON(value : ListShortCodeResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListShortCodeResponse = ?json;
    }
}

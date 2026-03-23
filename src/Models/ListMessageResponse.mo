
import { type ApiV2010AccountMessage; JSON = ApiV2010AccountMessage } "./ApiV2010AccountMessage";

// ListMessageResponse.mo

module {
    // User-facing type: what application code uses
    public type ListMessageResponse = {
        messages : ?[ApiV2010AccountMessage];
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
        // Named "JSON" to avoid shadowing the outer ListMessageResponse type
        public type JSON = {
            messages : ?[ApiV2010AccountMessage];
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
        public func toJSON(value : ListMessageResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListMessageResponse = ?json;
    }
}

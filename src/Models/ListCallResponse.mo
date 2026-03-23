
import { type ApiV2010AccountCall; JSON = ApiV2010AccountCall } "./ApiV2010AccountCall";

// ListCallResponse.mo

module {
    // User-facing type: what application code uses
    public type ListCallResponse = {
        calls : ?[ApiV2010AccountCall];
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
        // Named "JSON" to avoid shadowing the outer ListCallResponse type
        public type JSON = {
            calls : ?[ApiV2010AccountCall];
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
        public func toJSON(value : ListCallResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListCallResponse = ?json;
    }
}

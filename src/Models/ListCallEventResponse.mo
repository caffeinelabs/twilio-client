
import { type ApiV2010AccountCallCallEvent; JSON = ApiV2010AccountCallCallEvent } "./ApiV2010AccountCallCallEvent";

// ListCallEventResponse.mo

module {
    // User-facing type: what application code uses
    public type ListCallEventResponse = {
        events : ?[ApiV2010AccountCallCallEvent];
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
        // Named "JSON" to avoid shadowing the outer ListCallEventResponse type
        public type JSON = {
            events : ?[ApiV2010AccountCallCallEvent];
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
        public func toJSON(value : ListCallEventResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListCallEventResponse = ?json;
    }
}

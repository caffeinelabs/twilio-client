
import { type ApiV2010AccountOutgoingCallerId; JSON = ApiV2010AccountOutgoingCallerId } "./ApiV2010AccountOutgoingCallerId";

// ListOutgoingCallerIdResponse.mo

module {
    // User-facing type: what application code uses
    public type ListOutgoingCallerIdResponse = {
        outgoing_caller_ids : ?[ApiV2010AccountOutgoingCallerId];
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
        // Named "JSON" to avoid shadowing the outer ListOutgoingCallerIdResponse type
        public type JSON = {
            outgoing_caller_ids : ?[ApiV2010AccountOutgoingCallerId];
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
        public func toJSON(value : ListOutgoingCallerIdResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListOutgoingCallerIdResponse = ?json;
    }
}

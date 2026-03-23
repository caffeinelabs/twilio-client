
import { type ApiV2010AccountConference; JSON = ApiV2010AccountConference } "./ApiV2010AccountConference";

// ListConferenceResponse.mo

module {
    // User-facing type: what application code uses
    public type ListConferenceResponse = {
        conferences : ?[ApiV2010AccountConference];
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
        // Named "JSON" to avoid shadowing the outer ListConferenceResponse type
        public type JSON = {
            conferences : ?[ApiV2010AccountConference];
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
        public func toJSON(value : ListConferenceResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListConferenceResponse = ?json;
    }
}

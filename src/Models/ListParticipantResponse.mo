
import { type ApiV2010AccountConferenceParticipant; JSON = ApiV2010AccountConferenceParticipant } "./ApiV2010AccountConferenceParticipant";

// ListParticipantResponse.mo

module {
    // User-facing type: what application code uses
    public type ListParticipantResponse = {
        participants : ?[ApiV2010AccountConferenceParticipant];
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
        // Named "JSON" to avoid shadowing the outer ListParticipantResponse type
        public type JSON = {
            participants : ?[ApiV2010AccountConferenceParticipant];
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
        public func toJSON(value : ListParticipantResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListParticipantResponse = ?json;
    }
}

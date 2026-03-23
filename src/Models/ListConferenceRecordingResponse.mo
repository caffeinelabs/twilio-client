
import { type ApiV2010AccountConferenceConferenceRecording; JSON = ApiV2010AccountConferenceConferenceRecording } "./ApiV2010AccountConferenceConferenceRecording";

// ListConferenceRecordingResponse.mo

module {
    // User-facing type: what application code uses
    public type ListConferenceRecordingResponse = {
        recordings : ?[ApiV2010AccountConferenceConferenceRecording];
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
        // Named "JSON" to avoid shadowing the outer ListConferenceRecordingResponse type
        public type JSON = {
            recordings : ?[ApiV2010AccountConferenceConferenceRecording];
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
        public func toJSON(value : ListConferenceRecordingResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListConferenceRecordingResponse = ?json;
    }
}

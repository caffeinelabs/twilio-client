
import { type ApiV2010AccountRecording; JSON = ApiV2010AccountRecording } "./ApiV2010AccountRecording";

// ListRecordingResponse.mo

module {
    // User-facing type: what application code uses
    public type ListRecordingResponse = {
        recordings : ?[ApiV2010AccountRecording];
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
        // Named "JSON" to avoid shadowing the outer ListRecordingResponse type
        public type JSON = {
            recordings : ?[ApiV2010AccountRecording];
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
        public func toJSON(value : ListRecordingResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListRecordingResponse = ?json;
    }
}

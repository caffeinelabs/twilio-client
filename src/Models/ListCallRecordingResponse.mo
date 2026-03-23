
import { type ApiV2010AccountCallCallRecording; JSON = ApiV2010AccountCallCallRecording } "./ApiV2010AccountCallCallRecording";

// ListCallRecordingResponse.mo

module {
    // User-facing type: what application code uses
    public type ListCallRecordingResponse = {
        recordings : ?[ApiV2010AccountCallCallRecording];
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
        // Named "JSON" to avoid shadowing the outer ListCallRecordingResponse type
        public type JSON = {
            recordings : ?[ApiV2010AccountCallCallRecording];
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
        public func toJSON(value : ListCallRecordingResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListCallRecordingResponse = ?json;
    }
}


import { type ApiV2010AccountRecordingRecordingTranscription; JSON = ApiV2010AccountRecordingRecordingTranscription } "./ApiV2010AccountRecordingRecordingTranscription";

// ListRecordingTranscriptionResponse.mo

module {
    // User-facing type: what application code uses
    public type ListRecordingTranscriptionResponse = {
        transcriptions : ?[ApiV2010AccountRecordingRecordingTranscription];
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
        // Named "JSON" to avoid shadowing the outer ListRecordingTranscriptionResponse type
        public type JSON = {
            transcriptions : ?[ApiV2010AccountRecordingRecordingTranscription];
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
        public func toJSON(value : ListRecordingTranscriptionResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListRecordingTranscriptionResponse = ?json;
    }
}

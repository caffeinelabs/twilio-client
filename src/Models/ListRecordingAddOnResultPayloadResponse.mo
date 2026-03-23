
import { type ApiV2010AccountRecordingRecordingAddOnResultRecordingAddOnResultPayload; JSON = ApiV2010AccountRecordingRecordingAddOnResultRecordingAddOnResultPayload } "./ApiV2010AccountRecordingRecordingAddOnResultRecordingAddOnResultPayload";

// ListRecordingAddOnResultPayloadResponse.mo

module {
    // User-facing type: what application code uses
    public type ListRecordingAddOnResultPayloadResponse = {
        payloads : ?[ApiV2010AccountRecordingRecordingAddOnResultRecordingAddOnResultPayload];
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
        // Named "JSON" to avoid shadowing the outer ListRecordingAddOnResultPayloadResponse type
        public type JSON = {
            payloads : ?[ApiV2010AccountRecordingRecordingAddOnResultRecordingAddOnResultPayload];
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
        public func toJSON(value : ListRecordingAddOnResultPayloadResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListRecordingAddOnResultPayloadResponse = ?json;
    }
}

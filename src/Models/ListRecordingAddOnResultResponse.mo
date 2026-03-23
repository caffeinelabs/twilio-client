
import { type ApiV2010AccountRecordingRecordingAddOnResult; JSON = ApiV2010AccountRecordingRecordingAddOnResult } "./ApiV2010AccountRecordingRecordingAddOnResult";

// ListRecordingAddOnResultResponse.mo

module {
    // User-facing type: what application code uses
    public type ListRecordingAddOnResultResponse = {
        add_on_results : ?[ApiV2010AccountRecordingRecordingAddOnResult];
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
        // Named "JSON" to avoid shadowing the outer ListRecordingAddOnResultResponse type
        public type JSON = {
            add_on_results : ?[ApiV2010AccountRecordingRecordingAddOnResult];
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
        public func toJSON(value : ListRecordingAddOnResultResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListRecordingAddOnResultResponse = ?json;
    }
}

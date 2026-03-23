
import { type ApiV2010AccountMessageMedia; JSON = ApiV2010AccountMessageMedia } "./ApiV2010AccountMessageMedia";

// ListMediaResponse.mo

module {
    // User-facing type: what application code uses
    public type ListMediaResponse = {
        media_list : ?[ApiV2010AccountMessageMedia];
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
        // Named "JSON" to avoid shadowing the outer ListMediaResponse type
        public type JSON = {
            media_list : ?[ApiV2010AccountMessageMedia];
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
        public func toJSON(value : ListMediaResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListMediaResponse = ?json;
    }
}

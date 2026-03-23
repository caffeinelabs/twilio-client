
import { type ApiV2010AccountSigningKey; JSON = ApiV2010AccountSigningKey } "./ApiV2010AccountSigningKey";

// ListSigningKeyResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSigningKeyResponse = {
        signing_keys : ?[ApiV2010AccountSigningKey];
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
        // Named "JSON" to avoid shadowing the outer ListSigningKeyResponse type
        public type JSON = {
            signing_keys : ?[ApiV2010AccountSigningKey];
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
        public func toJSON(value : ListSigningKeyResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSigningKeyResponse = ?json;
    }
}

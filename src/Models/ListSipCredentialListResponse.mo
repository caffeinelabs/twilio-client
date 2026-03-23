
import { type ApiV2010AccountSipSipCredentialList; JSON = ApiV2010AccountSipSipCredentialList } "./ApiV2010AccountSipSipCredentialList";

// ListSipCredentialListResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSipCredentialListResponse = {
        credential_lists : ?[ApiV2010AccountSipSipCredentialList];
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
        // Named "JSON" to avoid shadowing the outer ListSipCredentialListResponse type
        public type JSON = {
            credential_lists : ?[ApiV2010AccountSipSipCredentialList];
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
        public func toJSON(value : ListSipCredentialListResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSipCredentialListResponse = ?json;
    }
}

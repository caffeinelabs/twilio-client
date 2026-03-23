
import { type ApiV2010AccountSipSipCredentialListSipCredential; JSON = ApiV2010AccountSipSipCredentialListSipCredential } "./ApiV2010AccountSipSipCredentialListSipCredential";

// ListSipCredentialResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSipCredentialResponse = {
        credentials : ?[ApiV2010AccountSipSipCredentialListSipCredential];
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
        // Named "JSON" to avoid shadowing the outer ListSipCredentialResponse type
        public type JSON = {
            credentials : ?[ApiV2010AccountSipSipCredentialListSipCredential];
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
        public func toJSON(value : ListSipCredentialResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSipCredentialResponse = ?json;
    }
}

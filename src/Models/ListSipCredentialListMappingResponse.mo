
import { type ApiV2010AccountSipSipDomainSipCredentialListMapping; JSON = ApiV2010AccountSipSipDomainSipCredentialListMapping } "./ApiV2010AccountSipSipDomainSipCredentialListMapping";

// ListSipCredentialListMappingResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSipCredentialListMappingResponse = {
        credential_list_mappings : ?[ApiV2010AccountSipSipDomainSipCredentialListMapping];
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
        // Named "JSON" to avoid shadowing the outer ListSipCredentialListMappingResponse type
        public type JSON = {
            credential_list_mappings : ?[ApiV2010AccountSipSipDomainSipCredentialListMapping];
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
        public func toJSON(value : ListSipCredentialListMappingResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSipCredentialListMappingResponse = ?json;
    }
}

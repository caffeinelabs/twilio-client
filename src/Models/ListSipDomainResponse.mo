
import { type ApiV2010AccountSipSipDomain; JSON = ApiV2010AccountSipSipDomain } "./ApiV2010AccountSipSipDomain";

// ListSipDomainResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSipDomainResponse = {
        domains : ?[ApiV2010AccountSipSipDomain];
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
        // Named "JSON" to avoid shadowing the outer ListSipDomainResponse type
        public type JSON = {
            domains : ?[ApiV2010AccountSipSipDomain];
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
        public func toJSON(value : ListSipDomainResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSipDomainResponse = ?json;
    }
}


import { type ApiV2010AccountAddress; JSON = ApiV2010AccountAddress } "./ApiV2010AccountAddress";

// ListAddressResponse.mo

module {
    // User-facing type: what application code uses
    public type ListAddressResponse = {
        addresses : ?[ApiV2010AccountAddress];
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
        // Named "JSON" to avoid shadowing the outer ListAddressResponse type
        public type JSON = {
            addresses : ?[ApiV2010AccountAddress];
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
        public func toJSON(value : ListAddressResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAddressResponse = ?json;
    }
}

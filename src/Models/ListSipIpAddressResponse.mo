
import { type ApiV2010AccountSipSipIpAccessControlListSipIpAddress; JSON = ApiV2010AccountSipSipIpAccessControlListSipIpAddress } "./ApiV2010AccountSipSipIpAccessControlListSipIpAddress";

// ListSipIpAddressResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSipIpAddressResponse = {
        ip_addresses : ?[ApiV2010AccountSipSipIpAccessControlListSipIpAddress];
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
        // Named "JSON" to avoid shadowing the outer ListSipIpAddressResponse type
        public type JSON = {
            ip_addresses : ?[ApiV2010AccountSipSipIpAccessControlListSipIpAddress];
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
        public func toJSON(value : ListSipIpAddressResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSipIpAddressResponse = ?json;
    }
}

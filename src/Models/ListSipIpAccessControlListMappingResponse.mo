
import { type ApiV2010AccountSipSipDomainSipIpAccessControlListMapping; JSON = ApiV2010AccountSipSipDomainSipIpAccessControlListMapping } "./ApiV2010AccountSipSipDomainSipIpAccessControlListMapping";

// ListSipIpAccessControlListMappingResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSipIpAccessControlListMappingResponse = {
        ip_access_control_list_mappings : ?[ApiV2010AccountSipSipDomainSipIpAccessControlListMapping];
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
        // Named "JSON" to avoid shadowing the outer ListSipIpAccessControlListMappingResponse type
        public type JSON = {
            ip_access_control_list_mappings : ?[ApiV2010AccountSipSipDomainSipIpAccessControlListMapping];
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
        public func toJSON(value : ListSipIpAccessControlListMappingResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSipIpAccessControlListMappingResponse = ?json;
    }
}

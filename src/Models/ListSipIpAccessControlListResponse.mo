
import { type ApiV2010AccountSipSipIpAccessControlList; JSON = ApiV2010AccountSipSipIpAccessControlList } "./ApiV2010AccountSipSipIpAccessControlList";

// ListSipIpAccessControlListResponse.mo

module {
    // User-facing type: what application code uses
    public type ListSipIpAccessControlListResponse = {
        ip_access_control_lists : ?[ApiV2010AccountSipSipIpAccessControlList];
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
        // Named "JSON" to avoid shadowing the outer ListSipIpAccessControlListResponse type
        public type JSON = {
            ip_access_control_lists : ?[ApiV2010AccountSipSipIpAccessControlList];
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
        public func toJSON(value : ListSipIpAccessControlListResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListSipIpAccessControlListResponse = ?json;
    }
}


import { type ApiV2010AccountAuthorizedConnectApp; JSON = ApiV2010AccountAuthorizedConnectApp } "./ApiV2010AccountAuthorizedConnectApp";

// ListAuthorizedConnectAppResponse.mo

module {
    // User-facing type: what application code uses
    public type ListAuthorizedConnectAppResponse = {
        authorized_connect_apps : ?[ApiV2010AccountAuthorizedConnectApp];
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
        // Named "JSON" to avoid shadowing the outer ListAuthorizedConnectAppResponse type
        public type JSON = {
            authorized_connect_apps : ?[ApiV2010AccountAuthorizedConnectApp];
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
        public func toJSON(value : ListAuthorizedConnectAppResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAuthorizedConnectAppResponse = ?json;
    }
}

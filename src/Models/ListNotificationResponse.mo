
import { type ApiV2010AccountNotification; JSON = ApiV2010AccountNotification } "./ApiV2010AccountNotification";

// ListNotificationResponse.mo

module {
    // User-facing type: what application code uses
    public type ListNotificationResponse = {
        notifications : ?[ApiV2010AccountNotification];
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
        // Named "JSON" to avoid shadowing the outer ListNotificationResponse type
        public type JSON = {
            notifications : ?[ApiV2010AccountNotification];
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
        public func toJSON(value : ListNotificationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListNotificationResponse = ?json;
    }
}

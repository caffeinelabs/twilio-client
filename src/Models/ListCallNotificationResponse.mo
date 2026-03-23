
import { type ApiV2010AccountCallCallNotification; JSON = ApiV2010AccountCallCallNotification } "./ApiV2010AccountCallCallNotification";

// ListCallNotificationResponse.mo

module {
    // User-facing type: what application code uses
    public type ListCallNotificationResponse = {
        notifications : ?[ApiV2010AccountCallCallNotification];
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
        // Named "JSON" to avoid shadowing the outer ListCallNotificationResponse type
        public type JSON = {
            notifications : ?[ApiV2010AccountCallCallNotification];
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
        public func toJSON(value : ListCallNotificationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListCallNotificationResponse = ?json;
    }
}


import { type ApiV2010AccountUsageUsageRecordUsageRecordToday; JSON = ApiV2010AccountUsageUsageRecordUsageRecordToday } "./ApiV2010AccountUsageUsageRecordUsageRecordToday";

// ListUsageRecordTodayResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUsageRecordTodayResponse = {
        usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordToday];
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
        // Named "JSON" to avoid shadowing the outer ListUsageRecordTodayResponse type
        public type JSON = {
            usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordToday];
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
        public func toJSON(value : ListUsageRecordTodayResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUsageRecordTodayResponse = ?json;
    }
}

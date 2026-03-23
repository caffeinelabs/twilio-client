
import { type ApiV2010AccountUsageUsageRecordUsageRecordLastMonth; JSON = ApiV2010AccountUsageUsageRecordUsageRecordLastMonth } "./ApiV2010AccountUsageUsageRecordUsageRecordLastMonth";

// ListUsageRecordLastMonthResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUsageRecordLastMonthResponse = {
        usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordLastMonth];
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
        // Named "JSON" to avoid shadowing the outer ListUsageRecordLastMonthResponse type
        public type JSON = {
            usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordLastMonth];
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
        public func toJSON(value : ListUsageRecordLastMonthResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUsageRecordLastMonthResponse = ?json;
    }
}

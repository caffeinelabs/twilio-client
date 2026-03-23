
import { type ApiV2010AccountUsageUsageRecordUsageRecordMonthly; JSON = ApiV2010AccountUsageUsageRecordUsageRecordMonthly } "./ApiV2010AccountUsageUsageRecordUsageRecordMonthly";

// ListUsageRecordMonthlyResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUsageRecordMonthlyResponse = {
        usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordMonthly];
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
        // Named "JSON" to avoid shadowing the outer ListUsageRecordMonthlyResponse type
        public type JSON = {
            usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordMonthly];
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
        public func toJSON(value : ListUsageRecordMonthlyResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUsageRecordMonthlyResponse = ?json;
    }
}

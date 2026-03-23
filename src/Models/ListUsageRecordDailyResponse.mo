
import { type ApiV2010AccountUsageUsageRecordUsageRecordDaily; JSON = ApiV2010AccountUsageUsageRecordUsageRecordDaily } "./ApiV2010AccountUsageUsageRecordUsageRecordDaily";

// ListUsageRecordDailyResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUsageRecordDailyResponse = {
        usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordDaily];
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
        // Named "JSON" to avoid shadowing the outer ListUsageRecordDailyResponse type
        public type JSON = {
            usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordDaily];
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
        public func toJSON(value : ListUsageRecordDailyResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUsageRecordDailyResponse = ?json;
    }
}

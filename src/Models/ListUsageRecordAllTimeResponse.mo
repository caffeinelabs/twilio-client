
import { type ApiV2010AccountUsageUsageRecordUsageRecordAllTime; JSON = ApiV2010AccountUsageUsageRecordUsageRecordAllTime } "./ApiV2010AccountUsageUsageRecordUsageRecordAllTime";

// ListUsageRecordAllTimeResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUsageRecordAllTimeResponse = {
        usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordAllTime];
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
        // Named "JSON" to avoid shadowing the outer ListUsageRecordAllTimeResponse type
        public type JSON = {
            usage_records : ?[ApiV2010AccountUsageUsageRecordUsageRecordAllTime];
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
        public func toJSON(value : ListUsageRecordAllTimeResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUsageRecordAllTimeResponse = ?json;
    }
}

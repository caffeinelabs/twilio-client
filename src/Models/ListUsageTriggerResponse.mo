
import { type ApiV2010AccountUsageUsageTrigger; JSON = ApiV2010AccountUsageUsageTrigger } "./ApiV2010AccountUsageUsageTrigger";

// ListUsageTriggerResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUsageTriggerResponse = {
        usage_triggers : ?[ApiV2010AccountUsageUsageTrigger];
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
        // Named "JSON" to avoid shadowing the outer ListUsageTriggerResponse type
        public type JSON = {
            usage_triggers : ?[ApiV2010AccountUsageUsageTrigger];
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
        public func toJSON(value : ListUsageTriggerResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUsageTriggerResponse = ?json;
    }
}

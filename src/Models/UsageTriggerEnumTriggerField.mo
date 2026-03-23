
// UsageTriggerEnumTriggerField.mo
/// The field in the [UsageRecord](https://www.twilio.com/docs/usage/api/usage-record) resource that fires the trigger.  Can be: `count`, `usage`, or `price`, as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price).
/// Enum values: #count, #usage, #price

module {
    // User-facing type: type-safe variants for application code
    public type UsageTriggerEnumTriggerField = {
        #count;
        #usage;
        #price;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsageTriggerEnumTriggerField type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsageTriggerEnumTriggerField) : JSON =
            switch (value) {
                case (#count) "count";
                case (#usage) "usage";
                case (#price) "price";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsageTriggerEnumTriggerField =
            switch (json) {
                case "count" ?#count;
                case "usage" ?#usage;
                case "price" ?#price;
                case _ null;
            };
    }
}

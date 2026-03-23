
// UsageTriggerEnumRecurring.mo
/// The frequency of a recurring UsageTrigger.  Can be: `daily`, `monthly`, or `yearly` for recurring triggers or empty for non-recurring triggers. A trigger will only fire once during each period. Recurring times are in GMT.
/// Enum values: #daily, #monthly, #yearly, #alltime

module {
    // User-facing type: type-safe variants for application code
    public type UsageTriggerEnumRecurring = {
        #daily;
        #monthly;
        #yearly;
        #alltime;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsageTriggerEnumRecurring type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsageTriggerEnumRecurring) : JSON =
            switch (value) {
                case (#daily) "daily";
                case (#monthly) "monthly";
                case (#yearly) "yearly";
                case (#alltime) "alltime";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsageTriggerEnumRecurring =
            switch (json) {
                case "daily" ?#daily;
                case "monthly" ?#monthly;
                case "yearly" ?#yearly;
                case "alltime" ?#alltime;
                case _ null;
            };
    }
}

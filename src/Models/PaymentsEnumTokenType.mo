
// PaymentsEnumTokenType.mo
/// Indicates whether the payment method should be tokenized as a `one-time`, `reusable`, or `payment-method` token. The default value is `reusable`. Do not enter a charge amount when tokenizing. If a charge amount is entered, the payment method will be charged and not tokenized.
/// Enum values: #one_time, #reusable, #payment_method

module {
    // User-facing type: type-safe variants for application code
    public type PaymentsEnumTokenType = {
        #one_time;
        #reusable;
        #payment_method;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PaymentsEnumTokenType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PaymentsEnumTokenType) : JSON =
            switch (value) {
                case (#one_time) "one-time";
                case (#reusable) "reusable";
                case (#payment_method) "payment-method";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PaymentsEnumTokenType =
            switch (json) {
                case "one-time" ?#one_time;
                case "reusable" ?#reusable;
                case "payment-method" ?#payment_method;
                case _ null;
            };
    }
}

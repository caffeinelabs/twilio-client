
// PaymentsEnumBankAccountType.mo
/// Type of bank account if payment source is ACH. One of `consumer-checking`, `consumer-savings`, or `commercial-checking`. The default value is `consumer-checking`.
/// Enum values: #consumer_checking, #consumer_savings, #commercial_checking

module {
    // User-facing type: type-safe variants for application code
    public type PaymentsEnumBankAccountType = {
        #consumer_checking;
        #consumer_savings;
        #commercial_checking;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PaymentsEnumBankAccountType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PaymentsEnumBankAccountType) : JSON =
            switch (value) {
                case (#consumer_checking) "consumer-checking";
                case (#consumer_savings) "consumer-savings";
                case (#commercial_checking) "commercial-checking";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PaymentsEnumBankAccountType =
            switch (json) {
                case "consumer-checking" ?#consumer_checking;
                case "consumer-savings" ?#consumer_savings;
                case "commercial-checking" ?#commercial_checking;
                case _ null;
            };
    }
}

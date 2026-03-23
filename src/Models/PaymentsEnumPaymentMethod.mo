
// PaymentsEnumPaymentMethod.mo
/// Type of payment being captured. One of `credit-card` or `ach-debit`. The default value is `credit-card`.
/// Enum values: #credit_card, #ach_debit

module {
    // User-facing type: type-safe variants for application code
    public type PaymentsEnumPaymentMethod = {
        #credit_card;
        #ach_debit;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PaymentsEnumPaymentMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PaymentsEnumPaymentMethod) : JSON =
            switch (value) {
                case (#credit_card) "credit-card";
                case (#ach_debit) "ach-debit";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PaymentsEnumPaymentMethod =
            switch (json) {
                case "credit-card" ?#credit_card;
                case "ach-debit" ?#ach_debit;
                case _ null;
            };
    }
}


// PaymentsEnumCapture.mo
/// The piece of payment information that you wish the caller to enter. Must be one of `payment-card-number`, `expiration-date`, `security-code`, `postal-code`, `bank-routing-number`, `bank-account-number`, or their `-matcher` variants for input confirmation when `RequireMatchingInputs` is enabled.
/// Enum values: #payment_card_number, #expiration_date, #security_code, #postal_code, #bank_routing_number, #bank_account_number, #payment_card_number_matcher, #expiration_date_matcher, #security_code_matcher, #postal_code_matcher

module {
    // User-facing type: type-safe variants for application code
    public type PaymentsEnumCapture = {
        #payment_card_number;
        #expiration_date;
        #security_code;
        #postal_code;
        #bank_routing_number;
        #bank_account_number;
        #payment_card_number_matcher;
        #expiration_date_matcher;
        #security_code_matcher;
        #postal_code_matcher;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PaymentsEnumCapture type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PaymentsEnumCapture) : JSON =
            switch (value) {
                case (#payment_card_number) "payment-card-number";
                case (#expiration_date) "expiration-date";
                case (#security_code) "security-code";
                case (#postal_code) "postal-code";
                case (#bank_routing_number) "bank-routing-number";
                case (#bank_account_number) "bank-account-number";
                case (#payment_card_number_matcher) "payment-card-number-matcher";
                case (#expiration_date_matcher) "expiration-date-matcher";
                case (#security_code_matcher) "security-code-matcher";
                case (#postal_code_matcher) "postal-code-matcher";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PaymentsEnumCapture =
            switch (json) {
                case "payment-card-number" ?#payment_card_number;
                case "expiration-date" ?#expiration_date;
                case "security-code" ?#security_code;
                case "postal-code" ?#postal_code;
                case "bank-routing-number" ?#bank_routing_number;
                case "bank-account-number" ?#bank_account_number;
                case "payment-card-number-matcher" ?#payment_card_number_matcher;
                case "expiration-date-matcher" ?#expiration_date_matcher;
                case "security-code-matcher" ?#security_code_matcher;
                case "postal-code-matcher" ?#postal_code_matcher;
                case _ null;
            };
    }
}

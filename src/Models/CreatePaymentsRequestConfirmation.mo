
// CreatePaymentsRequestConfirmation.mo
/// Whether to prompt the caller to confirm their payment information before submitting to the payment gateway. If `true`, the caller will hear the last 4 digits of their card or account number and must press 1 to confirm or 2 to cancel. Default is `false`.
/// Enum values: #true_, #false_

module {
    // User-facing type: type-safe variants for application code
    public type CreatePaymentsRequestConfirmation = {
        #true_;
        #false_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreatePaymentsRequestConfirmation type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreatePaymentsRequestConfirmation) : JSON =
            switch (value) {
                case (#true_) "true";
                case (#false_) "false";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreatePaymentsRequestConfirmation =
            switch (json) {
                case "true" ?#true_;
                case "false" ?#false_;
                case _ null;
            };
    }
}

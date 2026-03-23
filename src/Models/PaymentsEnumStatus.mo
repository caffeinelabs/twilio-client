
// PaymentsEnumStatus.mo
/// Indicates whether the current payment session should be cancelled or completed. When `cancel` the payment session is cancelled. When `complete`, Twilio sends the payment information to the selected Pay Connector for processing.
/// Enum values: #complete, #cancel

module {
    // User-facing type: type-safe variants for application code
    public type PaymentsEnumStatus = {
        #complete;
        #cancel;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PaymentsEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PaymentsEnumStatus) : JSON =
            switch (value) {
                case (#complete) "complete";
                case (#cancel) "cancel";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PaymentsEnumStatus =
            switch (json) {
                case "complete" ?#complete;
                case "cancel" ?#cancel;
                case _ null;
            };
    }
}

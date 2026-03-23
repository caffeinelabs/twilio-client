
// SmsFeedbackEnumOutcome.mo
/// Enum values: #confirmed, #unconfirmed, #received, #not_received, #delayed

module {
    // User-facing type: type-safe variants for application code
    public type SmsFeedbackEnumOutcome = {
        #confirmed;
        #unconfirmed;
        #received;
        #not_received;
        #delayed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SmsFeedbackEnumOutcome type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SmsFeedbackEnumOutcome) : JSON =
            switch (value) {
                case (#confirmed) "confirmed";
                case (#unconfirmed) "unconfirmed";
                case (#received) "received";
                case (#not_received) "not-received";
                case (#delayed) "delayed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SmsFeedbackEnumOutcome =
            switch (json) {
                case "confirmed" ?#confirmed;
                case "unconfirmed" ?#unconfirmed;
                case "received" ?#received;
                case "not-received" ?#not_received;
                case "delayed" ?#delayed;
                case _ null;
            };
    }
}

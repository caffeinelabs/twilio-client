
// CallEnumEvent.mo
/// Enum values: #initiated, #ringing, #answered, #completed

module {
    // User-facing type: type-safe variants for application code
    public type CallEnumEvent = {
        #initiated;
        #ringing;
        #answered;
        #completed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CallEnumEvent type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CallEnumEvent) : JSON =
            switch (value) {
                case (#initiated) "initiated";
                case (#ringing) "ringing";
                case (#answered) "answered";
                case (#completed) "completed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CallEnumEvent =
            switch (json) {
                case "initiated" ?#initiated;
                case "ringing" ?#ringing;
                case "answered" ?#answered;
                case "completed" ?#completed;
                case _ null;
            };
    }
}

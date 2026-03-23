
// CallEnumUpdateStatus.mo
/// Enum values: #canceled, #completed

module {
    // User-facing type: type-safe variants for application code
    public type CallEnumUpdateStatus = {
        #canceled;
        #completed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CallEnumUpdateStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CallEnumUpdateStatus) : JSON =
            switch (value) {
                case (#canceled) "canceled";
                case (#completed) "completed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CallEnumUpdateStatus =
            switch (json) {
                case "canceled" ?#canceled;
                case "completed" ?#completed;
                case _ null;
            };
    }
}

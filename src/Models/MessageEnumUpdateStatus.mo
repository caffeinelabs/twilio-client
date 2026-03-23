
// MessageEnumUpdateStatus.mo
/// Enum values: #canceled

module {
    // User-facing type: type-safe variants for application code
    public type MessageEnumUpdateStatus = {
        #canceled;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessageEnumUpdateStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageEnumUpdateStatus) : JSON =
            switch (value) {
                case (#canceled) "canceled";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessageEnumUpdateStatus =
            switch (json) {
                case "canceled" ?#canceled;
                case _ null;
            };
    }
}

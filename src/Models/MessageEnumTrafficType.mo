
// MessageEnumTrafficType.mo
/// Enum values: #free

module {
    // User-facing type: type-safe variants for application code
    public type MessageEnumTrafficType = {
        #free;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessageEnumTrafficType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageEnumTrafficType) : JSON =
            switch (value) {
                case (#free) "free";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessageEnumTrafficType =
            switch (json) {
                case "free" ?#free;
                case _ null;
            };
    }
}


// AccountEnumType.mo
/// The type of this account. Either `Trial` or `Full` if it's been upgraded
/// Enum values: #trial, #full

module {
    // User-facing type: type-safe variants for application code
    public type AccountEnumType = {
        #trial;
        #full;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AccountEnumType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AccountEnumType) : JSON =
            switch (value) {
                case (#trial) "Trial";
                case (#full) "Full";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AccountEnumType =
            switch (json) {
                case "Trial" ?#trial;
                case "Full" ?#full;
                case _ null;
            };
    }
}

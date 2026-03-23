
// AccountEnumStatus.mo
/// The status of this account. Usually `active`, but can be `suspended` or `closed`.
/// Enum values: #active, #suspended, #closed

module {
    // User-facing type: type-safe variants for application code
    public type AccountEnumStatus = {
        #active;
        #suspended;
        #closed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AccountEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AccountEnumStatus) : JSON =
            switch (value) {
                case (#active) "active";
                case (#suspended) "suspended";
                case (#closed) "closed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AccountEnumStatus =
            switch (json) {
                case "active" ?#active;
                case "suspended" ?#suspended;
                case "closed" ?#closed;
                case _ null;
            };
    }
}

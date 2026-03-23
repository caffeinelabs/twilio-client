
// MessageEnumAddressRetention.mo
/// Determines if the address can be stored or obfuscated based on privacy settings
/// Enum values: #retain, #obfuscate

module {
    // User-facing type: type-safe variants for application code
    public type MessageEnumAddressRetention = {
        #retain;
        #obfuscate;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessageEnumAddressRetention type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageEnumAddressRetention) : JSON =
            switch (value) {
                case (#retain) "retain";
                case (#obfuscate) "obfuscate";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessageEnumAddressRetention =
            switch (json) {
                case "retain" ?#retain;
                case "obfuscate" ?#obfuscate;
                case _ null;
            };
    }
}

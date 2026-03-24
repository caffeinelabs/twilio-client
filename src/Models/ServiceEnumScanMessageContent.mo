
// ServiceEnumScanMessageContent.mo
/// Reserved.
/// Enum values: #inherit, #enable, #disable

module {
    // User-facing type: type-safe variants for application code
    public type ServiceEnumScanMessageContent = {
        #inherit;
        #enable;
        #disable;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ServiceEnumScanMessageContent type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ServiceEnumScanMessageContent) : JSON =
            switch (value) {
                case (#inherit) "inherit";
                case (#enable) "enable";
                case (#disable) "disable";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ServiceEnumScanMessageContent =
            switch (json) {
                case "inherit" ?#inherit;
                case "enable" ?#enable;
                case "disable" ?#disable;
                case _ null;
            };
    }
}

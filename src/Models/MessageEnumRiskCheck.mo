
// MessageEnumRiskCheck.mo
/// Include this parameter with a value of `disable` to skip any kind of risk check on the respective message request.
/// Enum values: #enable, #disable

module {
    // User-facing type: type-safe variants for application code
    public type MessageEnumRiskCheck = {
        #enable;
        #disable;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessageEnumRiskCheck type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageEnumRiskCheck) : JSON =
            switch (value) {
                case (#enable) "enable";
                case (#disable) "disable";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessageEnumRiskCheck =
            switch (json) {
                case "enable" ?#enable;
                case "disable" ?#disable;
                case _ null;
            };
    }
}

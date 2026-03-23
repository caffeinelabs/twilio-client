
// DependentPhoneNumberEnumEmergencyStatus.mo
/// Whether the phone number is enabled for emergency calling.
/// Enum values: #active, #inactive

module {
    // User-facing type: type-safe variants for application code
    public type DependentPhoneNumberEnumEmergencyStatus = {
        #active;
        #inactive;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DependentPhoneNumberEnumEmergencyStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DependentPhoneNumberEnumEmergencyStatus) : JSON =
            switch (value) {
                case (#active) "Active";
                case (#inactive) "Inactive";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DependentPhoneNumberEnumEmergencyStatus =
            switch (json) {
                case "Active" ?#active;
                case "Inactive" ?#inactive;
                case _ null;
            };
    }
}

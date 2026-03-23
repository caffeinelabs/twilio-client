
// IncomingPhoneNumberLocalEnumEmergencyStatus.mo
/// The parameter displays if emergency calling is enabled for this number. Active numbers may place emergency calls by dialing valid emergency numbers for the country.
/// Enum values: #active, #inactive

module {
    // User-facing type: type-safe variants for application code
    public type IncomingPhoneNumberLocalEnumEmergencyStatus = {
        #active;
        #inactive;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer IncomingPhoneNumberLocalEnumEmergencyStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : IncomingPhoneNumberLocalEnumEmergencyStatus) : JSON =
            switch (value) {
                case (#active) "Active";
                case (#inactive) "Inactive";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?IncomingPhoneNumberLocalEnumEmergencyStatus =
            switch (json) {
                case "Active" ?#active;
                case "Inactive" ?#inactive;
                case _ null;
            };
    }
}

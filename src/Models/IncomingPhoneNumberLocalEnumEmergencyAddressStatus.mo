
// IncomingPhoneNumberLocalEnumEmergencyAddressStatus.mo
/// The status of address registration with emergency services. A registered emergency address will be used during handling of emergency calls from this number.
/// Enum values: #registered, #unregistered, #pending_registration, #registration_failure, #pending_unregistration, #unregistration_failure

module {
    // User-facing type: type-safe variants for application code
    public type IncomingPhoneNumberLocalEnumEmergencyAddressStatus = {
        #registered;
        #unregistered;
        #pending_registration;
        #registration_failure;
        #pending_unregistration;
        #unregistration_failure;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer IncomingPhoneNumberLocalEnumEmergencyAddressStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : IncomingPhoneNumberLocalEnumEmergencyAddressStatus) : JSON =
            switch (value) {
                case (#registered) "registered";
                case (#unregistered) "unregistered";
                case (#pending_registration) "pending-registration";
                case (#registration_failure) "registration-failure";
                case (#pending_unregistration) "pending-unregistration";
                case (#unregistration_failure) "unregistration-failure";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?IncomingPhoneNumberLocalEnumEmergencyAddressStatus =
            switch (json) {
                case "registered" ?#registered;
                case "unregistered" ?#unregistered;
                case "pending-registration" ?#pending_registration;
                case "registration-failure" ?#registration_failure;
                case "pending-unregistration" ?#pending_unregistration;
                case "unregistration-failure" ?#unregistration_failure;
                case _ null;
            };
    }
}

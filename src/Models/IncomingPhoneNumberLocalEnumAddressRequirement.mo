
// IncomingPhoneNumberLocalEnumAddressRequirement.mo
/// Whether the phone number requires an [Address](https://www.twilio.com/docs/usage/api/address) registered with Twilio. Can be: `none`, `any`, `local`, or `foreign`.
/// Enum values: #none_, #any_, #local, #foreign

module {
    // User-facing type: type-safe variants for application code
    public type IncomingPhoneNumberLocalEnumAddressRequirement = {
        #none_;
        #any_;
        #local;
        #foreign;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer IncomingPhoneNumberLocalEnumAddressRequirement type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : IncomingPhoneNumberLocalEnumAddressRequirement) : JSON =
            switch (value) {
                case (#none_) "none";
                case (#any_) "any";
                case (#local) "local";
                case (#foreign) "foreign";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?IncomingPhoneNumberLocalEnumAddressRequirement =
            switch (json) {
                case "none" ?#none_;
                case "any" ?#any_;
                case "local" ?#local;
                case "foreign" ?#foreign;
                case _ null;
            };
    }
}

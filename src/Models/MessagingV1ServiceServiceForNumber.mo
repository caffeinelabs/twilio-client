
// MessagingV1ServiceServiceForNumber.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceServiceForNumber = {
        /// The SID to identify the number resource.
        number_sid : ?Text;
        /// The SID of the messaging service that the phone number is in.
        sid : ?Text;
        /// The string that you assigned to describe the messaging service resource.
        friendly_name : ?Text;
        /// The absolute URL of the Service resource.
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceServiceForNumber type
        public type JSON = {
            number_sid : ?Text;
            sid : ?Text;
            friendly_name : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceServiceForNumber) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceServiceForNumber = ?json;
    }
}

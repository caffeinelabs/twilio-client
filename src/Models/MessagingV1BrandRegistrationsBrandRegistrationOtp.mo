
// MessagingV1BrandRegistrationsBrandRegistrationOtp.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1BrandRegistrationsBrandRegistrationOtp = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Brand Registration resource.
        account_sid : ?Text;
        /// The unique string to identify Brand Registration of Sole Proprietor Brand
        brand_registration_sid : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1BrandRegistrationsBrandRegistrationOtp type
        public type JSON = {
            account_sid : ?Text;
            brand_registration_sid : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1BrandRegistrationsBrandRegistrationOtp) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1BrandRegistrationsBrandRegistrationOtp = ?json;
    }
}

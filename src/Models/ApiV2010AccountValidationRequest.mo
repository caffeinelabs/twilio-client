
// ApiV2010AccountValidationRequest.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountValidationRequest = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for the Caller ID.
        account_sid : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Caller ID is associated with.
        call_sid : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The phone number to verify in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
        phone_number : ?Text;
        /// The 6 digit validation code that someone must enter to validate the Caller ID  when `phone_number` is called.
        validation_code : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountValidationRequest type
        public type JSON = {
            account_sid : ?Text;
            call_sid : ?Text;
            friendly_name : ?Text;
            phone_number : ?Text;
            validation_code : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountValidationRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountValidationRequest = ?json;
    }
}

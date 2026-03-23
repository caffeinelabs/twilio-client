
// ApiV2010AccountCallUserDefinedMessage.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCallUserDefinedMessage = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created User Defined Message.
        account_sid : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Message is associated with.
        call_sid : ?Text;
        /// The SID that uniquely identifies this User Defined Message.
        sid : ?Text;
        /// The date that this User Defined Message was created, given in RFC 2822 format.
        date_created : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCallUserDefinedMessage type
        public type JSON = {
            account_sid : ?Text;
            call_sid : ?Text;
            sid : ?Text;
            date_created : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCallUserDefinedMessage) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCallUserDefinedMessage = ?json;
    }
}

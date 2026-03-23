
// ApiV2010AccountOutgoingCallerId.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountOutgoingCallerId = {
        /// The unique string that that we created to identify the OutgoingCallerId resource.
        sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the OutgoingCallerId resource.
        account_sid : ?Text;
        /// The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
        phone_number : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountOutgoingCallerId type
        public type JSON = {
            sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            friendly_name : ?Text;
            account_sid : ?Text;
            phone_number : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountOutgoingCallerId) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountOutgoingCallerId = ?json;
    }
}


// ApiV2010AccountCallPayments.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCallPayments = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Payments resource.
        account_sid : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Payments resource is associated with. This will refer to the call sid that is producing the payment card (credit/ACH) information thru DTMF.
        call_sid : ?Text;
        /// The SID of the Payments resource.
        sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCallPayments type
        public type JSON = {
            account_sid : ?Text;
            call_sid : ?Text;
            sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCallPayments) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCallPayments = ?json;
    }
}

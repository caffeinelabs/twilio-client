
// MessagingV1ServiceDestinationAlphaSender.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceDestinationAlphaSender = {
        /// The unique string that we created to identify the AlphaSender resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the AlphaSender resource.
        account_sid : ?Text;
        /// The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with.
        service_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The Alphanumeric Sender ID string.
        alpha_sender : ?Text;
        /// An array of values that describe whether the number can receive calls or messages. Can be: `SMS`.
        capabilities : ?[Text];
        /// The absolute URL of the AlphaSender resource.
        url : ?Text;
        /// The Two Character ISO Country Code the Alphanumeric Sender ID will be used for. For Default Alpha Senders that work across countries, this value will be an empty string
        iso_country_code : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceDestinationAlphaSender type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            service_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            alpha_sender : ?Text;
            capabilities : ?[Text];
            url : ?Text;
            iso_country_code : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceDestinationAlphaSender) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceDestinationAlphaSender = ?json;
    }
}

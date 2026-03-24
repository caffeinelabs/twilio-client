
// MessagingV1ServiceShortCode.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceShortCode = {
        /// The unique string that we created to identify the ShortCode resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ShortCode resource.
        account_sid : ?Text;
        /// The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with.
        service_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The [E.164](https://www.twilio.com/docs/glossary/what-e164) format of the short code.
        short_code : ?Text;
        /// The 2-character [ISO Country Code](https://www.iso.org/iso-3166-country-codes.html) of the number.
        country_code : ?Text;
        /// An array of values that describe whether the number can receive calls or messages. Can be: `SMS` and `MMS`.
        capabilities : ?[Text];
        /// The absolute URL of the ShortCode resource.
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceShortCode type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            service_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            short_code : ?Text;
            country_code : ?Text;
            capabilities : ?[Text];
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceShortCode) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceShortCode = ?json;
    }
}

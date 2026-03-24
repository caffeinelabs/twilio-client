
// MessagingV1ServiceGenericSender.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceGenericSender = {
        /// The SID to identify the number or channel sender resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the number or channel sender resource.
        account_sid : ?Text;
        /// The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with.
        service_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The unique string that identifies the number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format or the channel sender e.g whatsapp:+123456XXXX.
        sender : ?Text;
        /// A string value that identifies the number or channel sender type e.g AlphaSenderId, LongCode, ShortCode, Whatsapp, RCS.
        sender_type : ?Text;
        /// The 2-character [ISO Country Code](https://www.iso.org/iso-3166-country-codes.html) of the number or channel sender.
        country_code : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceGenericSender type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            service_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            sender : ?Text;
            sender_type : ?Text;
            country_code : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceGenericSender) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceGenericSender = ?json;
    }
}

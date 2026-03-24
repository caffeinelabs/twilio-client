
// MessagingV1ServiceChannelSender.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceChannelSender = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ChannelSender resource.
        account_sid : ?Text;
        /// The SID of the [Service](https://www.twilio.com/docs/messaging/services) the resource is associated with.
        messaging_service_sid : ?Text;
        /// The unique string that we created to identify the ChannelSender resource.
        sid : ?Text;
        /// The unique string that identifies the sender e.g whatsapp:+123456XXXX.
        sender : ?Text;
        /// A string value that identifies the sender type e.g WhatsApp, Messenger.
        sender_type : ?Text;
        /// The 2-character [ISO Country Code](https://www.iso.org/iso-3166-country-codes.html) of the number.
        country_code : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The absolute URL of the ChannelSender resource.
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceChannelSender type
        public type JSON = {
            account_sid : ?Text;
            messaging_service_sid : ?Text;
            sid : ?Text;
            sender : ?Text;
            sender_type : ?Text;
            country_code : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceChannelSender) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceChannelSender = ?json;
    }
}

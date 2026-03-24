
// MessagingV1ServicePhoneNumber.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServicePhoneNumber = {
        /// The unique string that we created to identify the PhoneNumber resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the PhoneNumber resource.
        account_sid : ?Text;
        /// The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with.
        service_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
        phone_number : ?Text;
        /// The 2-character [ISO Country Code](https://www.iso.org/iso-3166-country-codes.html) of the number.
        country_code : ?Text;
        /// An array of values that describe whether the number can receive calls or messages. Can be: `Voice`, `SMS`, and `MMS`.
        capabilities : ?[Text];
        /// The absolute URL of the PhoneNumber resource.
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServicePhoneNumber type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            service_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            phone_number : ?Text;
            country_code : ?Text;
            capabilities : ?[Text];
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServicePhoneNumber) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServicePhoneNumber = ?json;
    }
}

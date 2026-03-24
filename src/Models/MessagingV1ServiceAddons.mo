
// MessagingV1ServiceAddons.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceAddons = {
        /// The unique string that we created to identify the add on resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the add on resource.
        account_sid : ?Text;
        /// The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with.
        service_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The SID that identifies the add on type.
        add_on_type_sid : ?Text;
        /// The config of the add on in JSON string format.
        add_on_config : ?Text;
        /// The absolute URL of the add on resource.
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceAddons type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            service_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            add_on_type_sid : ?Text;
            add_on_config : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceAddons) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceAddons = ?json;
    }
}

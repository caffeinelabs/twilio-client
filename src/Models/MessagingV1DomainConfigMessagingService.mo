
// MessagingV1DomainConfigMessagingService.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1DomainConfigMessagingService = {
        /// The unique string that we created to identify the Domain resource.
        domain_sid : ?Text;
        /// The unique string that we created to identify the Domain config (prefix ZK).
        config_sid : ?Text;
        /// The unique string that identifies the messaging service
        messaging_service_sid : ?Text;
        /// Any requests we receive to this domain that do not match an existing shortened message will be redirected to the fallback url. These will likely be either expired messages, random misdirected traffic, or intentional scraping.
        fallback_url : ?Text;
        /// URL to receive click events to your webhook whenever the recipients click on the shortened links.
        callback_url : ?Text;
        /// Boolean field to set customer delivery preference when there is a failure in linkShortening service
        continue_on_failure : ?Bool;
        /// Date this Domain Config was created.
        date_created : ?Text;
        /// Date that this Domain Config was last updated.
        date_updated : ?Text;
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1DomainConfigMessagingService type
        public type JSON = {
            domain_sid : ?Text;
            config_sid : ?Text;
            messaging_service_sid : ?Text;
            fallback_url : ?Text;
            callback_url : ?Text;
            continue_on_failure : ?Bool;
            date_created : ?Text;
            date_updated : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1DomainConfigMessagingService) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1DomainConfigMessagingService = ?json;
    }
}

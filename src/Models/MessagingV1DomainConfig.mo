
// MessagingV1DomainConfig.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1DomainConfig = {
        /// The unique string that we created to identify the Domain resource.
        domain_sid : ?Text;
        /// The unique string that we created to identify the Domain config (prefix ZK).
        config_sid : ?Text;
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
        /// Customer's choice to send links with/without \"https://\" attached to shortened url. If true, messages will not be sent with https:// at the beginning of the url. If false, messages will be sent with https:// at the beginning of the url. False is the default behavior if it is not specified.
        disable_https : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1DomainConfig type
        public type JSON = {
            domain_sid : ?Text;
            config_sid : ?Text;
            fallback_url : ?Text;
            callback_url : ?Text;
            continue_on_failure : ?Bool;
            date_created : ?Text;
            date_updated : ?Text;
            url : ?Text;
            disable_https : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1DomainConfig) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1DomainConfig = ?json;
    }
}

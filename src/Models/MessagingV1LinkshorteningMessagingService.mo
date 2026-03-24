
// MessagingV1LinkshorteningMessagingService.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1LinkshorteningMessagingService = {
        /// The unique string identifies the domain resource
        domain_sid : ?Text;
        /// The unique string that identifies the messaging service
        messaging_service_sid : ?Text;
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1LinkshorteningMessagingService type
        public type JSON = {
            domain_sid : ?Text;
            messaging_service_sid : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1LinkshorteningMessagingService) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1LinkshorteningMessagingService = ?json;
    }
}

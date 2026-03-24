
// MessagingV1LinkshorteningMessagingServiceDomainAssociation.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1LinkshorteningMessagingServiceDomainAssociation = {
        /// The unique string that we created to identify the Domain resource.
        domain_sid : ?Text;
        /// The unique string that identifies the messaging service
        messaging_service_sid : ?Text;
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1LinkshorteningMessagingServiceDomainAssociation type
        public type JSON = {
            domain_sid : ?Text;
            messaging_service_sid : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1LinkshorteningMessagingServiceDomainAssociation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1LinkshorteningMessagingServiceDomainAssociation = ?json;
    }
}


// MessagingV1DomainDnsValidation.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1DomainDnsValidation = {
        /// The unique string that we created to identify the Domain resource.
        domain_sid : ?Text;
        is_valid : ?Bool;
        reason : ?Text;
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1DomainDnsValidation type
        public type JSON = {
            domain_sid : ?Text;
            is_valid : ?Bool;
            reason : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1DomainDnsValidation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1DomainDnsValidation = ?json;
    }
}

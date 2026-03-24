
// MessagingV1DomainCertV4.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1DomainCertV4 = {
        /// The unique string that we created to identify the Domain resource.
        domain_sid : ?Text;
        /// Date that this Domain was last updated.
        date_updated : ?Text;
        /// Date that the private certificate associated with this domain expires. You will need to update the certificate before that date to ensure your shortened links will continue to work.
        date_expires : ?Text;
        /// Date that this Domain was registered to the Twilio platform to create a new Domain object.
        date_created : ?Text;
        /// Full url path for this domain.
        domain_name : ?Text;
        /// The unique string that we created to identify this Certificate resource.
        certificate_sid : ?Text;
        url : ?Text;
        /// Optional JSON field describing the status and upload date of a new certificate in the process of validation
        cert_in_validation : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1DomainCertV4 type
        public type JSON = {
            domain_sid : ?Text;
            date_updated : ?Text;
            date_expires : ?Text;
            date_created : ?Text;
            domain_name : ?Text;
            certificate_sid : ?Text;
            url : ?Text;
            cert_in_validation : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1DomainCertV4) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1DomainCertV4 = ?json;
    }
}


// MessagingV1RequestManagedCert.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1RequestManagedCert = {
        /// The unique string that we created to identify the Domain resource.
        domain_sid : ?Text;
        /// Date that this Domain was last updated.
        date_updated : ?Text;
        /// Date that this Domain was registered to the Twilio platform to create a new Domain object.
        date_created : ?Text;
        /// Date that the private certificate associated with this domain expires. This is the expiration date of your existing cert.
        date_expires : ?Text;
        /// Full url path for this domain.
        domain_name : ?Text;
        /// The unique string that we created to identify this Certificate resource.
        certificate_sid : ?Text;
        url : ?Text;
        /// A boolean flag indicating if the certificate is managed by Twilio.
        managed : ?Bool;
        /// A boolean flag indicating if a managed certificate needs to be fulfilled by Twilio.
        requesting : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1RequestManagedCert type
        public type JSON = {
            domain_sid : ?Text;
            date_updated : ?Text;
            date_created : ?Text;
            date_expires : ?Text;
            domain_name : ?Text;
            certificate_sid : ?Text;
            url : ?Text;
            managed : ?Bool;
            requesting : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1RequestManagedCert) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1RequestManagedCert = ?json;
    }
}

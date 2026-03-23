
// ApiV2010AccountSipSipDomainSipIpAccessControlListMapping.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountSipSipDomainSipIpAccessControlListMapping = {
        /// The unique id of the Account that is responsible for this resource.
        account_sid : ?Text;
        /// The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        date_created : ?Text;
        /// The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        date_updated : ?Text;
        /// The unique string that is created to identify the SipDomain resource.
        domain_sid : ?Text;
        /// A human readable descriptive text for this resource, up to 64 characters long.
        friendly_name : ?Text;
        /// A 34 character string that uniquely identifies this resource.
        sid : ?Text;
        /// The URI for this resource, relative to `https://api.twilio.com`
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountSipSipDomainSipIpAccessControlListMapping type
        public type JSON = {
            account_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            domain_sid : ?Text;
            friendly_name : ?Text;
            sid : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountSipSipDomainSipIpAccessControlListMapping) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountSipSipDomainSipIpAccessControlListMapping = ?json;
    }
}

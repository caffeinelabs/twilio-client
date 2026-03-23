
// ApiV2010AccountSipSipCredentialListSipCredential.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountSipSipCredentialListSipCredential = {
        /// A 34 character string that uniquely identifies this resource.
        sid : ?Text;
        /// The unique id of the Account that is responsible for this resource.
        account_sid : ?Text;
        /// The unique id that identifies the credential list that includes this credential.
        credential_list_sid : ?Text;
        /// The username for this credential.
        username : ?Text;
        /// The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        date_created : ?Text;
        /// The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        date_updated : ?Text;
        /// The URI for this resource, relative to `https://api.twilio.com`
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountSipSipCredentialListSipCredential type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            credential_list_sid : ?Text;
            username : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountSipSipCredentialListSipCredential) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountSipSipCredentialListSipCredential = ?json;
    }
}

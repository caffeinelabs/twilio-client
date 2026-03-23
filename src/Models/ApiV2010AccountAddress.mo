
// ApiV2010AccountAddress.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountAddress = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that is responsible for the Address resource.
        account_sid : ?Text;
        /// The city in which the address is located.
        city : ?Text;
        /// The name associated with the address.This property has a maximum length of 16 4-byte characters, or 21 3-byte characters.
        customer_name : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The ISO country code of the address.
        iso_country : ?Text;
        /// The postal code of the address.
        postal_code : ?Text;
        /// The state or region of the address.
        region_ : ?Text;
        /// The unique string that that we created to identify the Address resource.
        sid : ?Text;
        /// The number and street address of the address.
        street : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// Whether emergency calling has been enabled on this number.
        emergency_enabled : ?Bool;
        /// Whether the address has been validated to comply with local regulation. In countries that require valid addresses, an invalid address will not be accepted. `true` indicates the Address has been validated. `false` indicate the country doesn't require validation or the Address is not valid.
        validated : ?Bool;
        /// Whether the address has been verified to comply with regulation. In countries that require valid addresses, an invalid address will not be accepted. `true` indicates the Address has been verified. `false` indicate the country doesn't require verified or the Address is not valid.
        verified : ?Bool;
        /// The additional number and street address of the address.
        street_secondary : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountAddress type
        public type JSON = {
            account_sid : ?Text;
            city : ?Text;
            customer_name : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            friendly_name : ?Text;
            iso_country : ?Text;
            postal_code : ?Text;
            region_ : ?Text;
            sid : ?Text;
            street : ?Text;
            uri : ?Text;
            emergency_enabled : ?Bool;
            validated : ?Bool;
            verified : ?Bool;
            street_secondary : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountAddress) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountAddress = ?json;
    }
}

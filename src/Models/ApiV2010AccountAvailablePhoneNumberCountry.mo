
// ApiV2010AccountAvailablePhoneNumberCountry.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountAvailablePhoneNumberCountry = {
        /// The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country.
        country_code : ?Text;
        /// The name of the country.
        country : ?Text;
        /// The URI of the Country resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// Whether all phone numbers available in the country are new to the Twilio platform. `true` if they are and `false` if all numbers are not in the Twilio Phone Number Beta program.
        beta : ?Bool;
        /// A list of related AvailablePhoneNumber resources identified by their URIs relative to `https://api.twilio.com`.
        subresource_uris : ?Any;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountAvailablePhoneNumberCountry type
        public type JSON = {
            country_code : ?Text;
            country : ?Text;
            uri : ?Text;
            beta : ?Bool;
            subresource_uris : ?Any;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountAvailablePhoneNumberCountry) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountAvailablePhoneNumberCountry = ?json;
    }
}

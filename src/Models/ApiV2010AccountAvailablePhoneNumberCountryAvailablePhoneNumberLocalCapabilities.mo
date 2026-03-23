
// ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities.mo
/// The set of Boolean properties that indicate whether a phone number can receive calls or messages.  Capabilities are: `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities = {
        mms : ?Bool;
        sms : ?Bool;
        voice : ?Bool;
        fax : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities type
        public type JSON = {
            mms : ?Bool;
            sms : ?Bool;
            voice : ?Bool;
            fax : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities = ?json;
    }
}

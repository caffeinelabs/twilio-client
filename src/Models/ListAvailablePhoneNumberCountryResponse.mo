
import { type ApiV2010AccountAvailablePhoneNumberCountry; JSON = ApiV2010AccountAvailablePhoneNumberCountry } "./ApiV2010AccountAvailablePhoneNumberCountry";

// ListAvailablePhoneNumberCountryResponse.mo

module {
    // User-facing type: what application code uses
    public type ListAvailablePhoneNumberCountryResponse = {
        countries : ?[ApiV2010AccountAvailablePhoneNumberCountry];
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListAvailablePhoneNumberCountryResponse type
        public type JSON = {
            countries : ?[ApiV2010AccountAvailablePhoneNumberCountry];
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListAvailablePhoneNumberCountryResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAvailablePhoneNumberCountryResponse = ?json;
    }
}

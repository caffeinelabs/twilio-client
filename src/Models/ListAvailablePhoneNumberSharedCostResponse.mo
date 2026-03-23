
import { type ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberSharedCost; JSON = ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberSharedCost } "./ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberSharedCost";

// ListAvailablePhoneNumberSharedCostResponse.mo

module {
    // User-facing type: what application code uses
    public type ListAvailablePhoneNumberSharedCostResponse = {
        available_phone_numbers : ?[ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberSharedCost];
        end : ?Int;
        first_page_uri : ?Text;
        next_page_uri : ?Text;
        page : ?Int;
        page_size : ?Int;
        previous_page_uri : ?Text;
        start : ?Int;
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListAvailablePhoneNumberSharedCostResponse type
        public type JSON = {
            available_phone_numbers : ?[ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberSharedCost];
            end : ?Int;
            first_page_uri : ?Text;
            next_page_uri : ?Text;
            page : ?Int;
            page_size : ?Int;
            previous_page_uri : ?Text;
            start : ?Int;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListAvailablePhoneNumberSharedCostResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAvailablePhoneNumberSharedCostResponse = ?json;
    }
}

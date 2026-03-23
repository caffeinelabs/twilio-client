
import { type ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree; JSON = ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree } "./ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree";

// ListAvailablePhoneNumberTollFreeResponse.mo

module {
    // User-facing type: what application code uses
    public type ListAvailablePhoneNumberTollFreeResponse = {
        available_phone_numbers : ?[ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree];
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
        // Named "JSON" to avoid shadowing the outer ListAvailablePhoneNumberTollFreeResponse type
        public type JSON = {
            available_phone_numbers : ?[ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree];
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
        public func toJSON(value : ListAvailablePhoneNumberTollFreeResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAvailablePhoneNumberTollFreeResponse = ?json;
    }
}

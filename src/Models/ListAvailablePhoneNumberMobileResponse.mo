
import { type ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberMobile; JSON = ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberMobile } "./ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberMobile";

// ListAvailablePhoneNumberMobileResponse.mo

module {
    // User-facing type: what application code uses
    public type ListAvailablePhoneNumberMobileResponse = {
        available_phone_numbers : ?[ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberMobile];
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
        // Named "JSON" to avoid shadowing the outer ListAvailablePhoneNumberMobileResponse type
        public type JSON = {
            available_phone_numbers : ?[ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberMobile];
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
        public func toJSON(value : ListAvailablePhoneNumberMobileResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAvailablePhoneNumberMobileResponse = ?json;
    }
}


import { type ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree; JSON = ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree } "./ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree";

// ListIncomingPhoneNumberTollFreeResponse.mo

module {
    // User-facing type: what application code uses
    public type ListIncomingPhoneNumberTollFreeResponse = {
        incoming_phone_numbers : ?[ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree];
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
        // Named "JSON" to avoid shadowing the outer ListIncomingPhoneNumberTollFreeResponse type
        public type JSON = {
            incoming_phone_numbers : ?[ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree];
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
        public func toJSON(value : ListIncomingPhoneNumberTollFreeResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListIncomingPhoneNumberTollFreeResponse = ?json;
    }
}


import { type ApiV2010AccountIncomingPhoneNumber; JSON = ApiV2010AccountIncomingPhoneNumber } "./ApiV2010AccountIncomingPhoneNumber";

// ListIncomingPhoneNumberResponse.mo

module {
    // User-facing type: what application code uses
    public type ListIncomingPhoneNumberResponse = {
        incoming_phone_numbers : ?[ApiV2010AccountIncomingPhoneNumber];
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
        // Named "JSON" to avoid shadowing the outer ListIncomingPhoneNumberResponse type
        public type JSON = {
            incoming_phone_numbers : ?[ApiV2010AccountIncomingPhoneNumber];
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
        public func toJSON(value : ListIncomingPhoneNumberResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListIncomingPhoneNumberResponse = ?json;
    }
}

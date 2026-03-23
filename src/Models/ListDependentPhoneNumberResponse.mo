
import { type ApiV2010AccountAddressDependentPhoneNumber; JSON = ApiV2010AccountAddressDependentPhoneNumber } "./ApiV2010AccountAddressDependentPhoneNumber";

// ListDependentPhoneNumberResponse.mo

module {
    // User-facing type: what application code uses
    public type ListDependentPhoneNumberResponse = {
        dependent_phone_numbers : ?[ApiV2010AccountAddressDependentPhoneNumber];
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
        // Named "JSON" to avoid shadowing the outer ListDependentPhoneNumberResponse type
        public type JSON = {
            dependent_phone_numbers : ?[ApiV2010AccountAddressDependentPhoneNumber];
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
        public func toJSON(value : ListDependentPhoneNumberResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListDependentPhoneNumberResponse = ?json;
    }
}

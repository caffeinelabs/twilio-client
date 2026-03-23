
import { type ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn; JSON = ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn } "./ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn";

// ListIncomingPhoneNumberAssignedAddOnResponse.mo

module {
    // User-facing type: what application code uses
    public type ListIncomingPhoneNumberAssignedAddOnResponse = {
        assigned_add_ons : ?[ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn];
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
        // Named "JSON" to avoid shadowing the outer ListIncomingPhoneNumberAssignedAddOnResponse type
        public type JSON = {
            assigned_add_ons : ?[ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn];
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
        public func toJSON(value : ListIncomingPhoneNumberAssignedAddOnResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListIncomingPhoneNumberAssignedAddOnResponse = ?json;
    }
}

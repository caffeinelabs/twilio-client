
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1ServicePhoneNumber; JSON = MessagingV1ServicePhoneNumber } "./MessagingV1ServicePhoneNumber";

// ListPhoneNumberResponse.mo

module {
    // User-facing type: what application code uses
    public type ListPhoneNumberResponse = {
        phone_numbers : ?[MessagingV1ServicePhoneNumber];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListPhoneNumberResponse type
        public type JSON = {
            phone_numbers : ?[MessagingV1ServicePhoneNumber];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListPhoneNumberResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListPhoneNumberResponse = ?json;
    }
}

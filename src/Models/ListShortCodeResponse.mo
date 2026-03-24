
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1ServiceShortCode; JSON = MessagingV1ServiceShortCode } "./MessagingV1ServiceShortCode";

// ListShortCodeResponse.mo

module {
    // User-facing type: what application code uses
    public type ListShortCodeResponse = {
        short_codes : ?[MessagingV1ServiceShortCode];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListShortCodeResponse type
        public type JSON = {
            short_codes : ?[MessagingV1ServiceShortCode];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListShortCodeResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListShortCodeResponse = ?json;
    }
}

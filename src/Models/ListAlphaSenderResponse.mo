
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1ServiceAlphaSender; JSON = MessagingV1ServiceAlphaSender } "./MessagingV1ServiceAlphaSender";

// ListAlphaSenderResponse.mo

module {
    // User-facing type: what application code uses
    public type ListAlphaSenderResponse = {
        alpha_senders : ?[MessagingV1ServiceAlphaSender];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListAlphaSenderResponse type
        public type JSON = {
            alpha_senders : ?[MessagingV1ServiceAlphaSender];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListAlphaSenderResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAlphaSenderResponse = ?json;
    }
}

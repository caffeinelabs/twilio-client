
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1ServiceDestinationAlphaSender; JSON = MessagingV1ServiceDestinationAlphaSender } "./MessagingV1ServiceDestinationAlphaSender";

// ListDestinationAlphaSenderResponse.mo

module {
    // User-facing type: what application code uses
    public type ListDestinationAlphaSenderResponse = {
        alpha_senders : ?[MessagingV1ServiceDestinationAlphaSender];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListDestinationAlphaSenderResponse type
        public type JSON = {
            alpha_senders : ?[MessagingV1ServiceDestinationAlphaSender];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListDestinationAlphaSenderResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListDestinationAlphaSenderResponse = ?json;
    }
}

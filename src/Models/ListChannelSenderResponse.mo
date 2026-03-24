
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1ServiceChannelSender; JSON = MessagingV1ServiceChannelSender } "./MessagingV1ServiceChannelSender";

// ListChannelSenderResponse.mo

module {
    // User-facing type: what application code uses
    public type ListChannelSenderResponse = {
        senders : ?[MessagingV1ServiceChannelSender];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListChannelSenderResponse type
        public type JSON = {
            senders : ?[MessagingV1ServiceChannelSender];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListChannelSenderResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListChannelSenderResponse = ?json;
    }
}

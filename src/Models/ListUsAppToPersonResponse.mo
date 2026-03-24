
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1ServiceUsAppToPersonResponse; JSON = MessagingV1ServiceUsAppToPersonResponse } "./MessagingV1ServiceUsAppToPersonResponse";

// ListUsAppToPersonResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUsAppToPersonResponse = {
        compliance : ?[MessagingV1ServiceUsAppToPersonResponse];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListUsAppToPersonResponse type
        public type JSON = {
            compliance : ?[MessagingV1ServiceUsAppToPersonResponse];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListUsAppToPersonResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUsAppToPersonResponse = ?json;
    }
}

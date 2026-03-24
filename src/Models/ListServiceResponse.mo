
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1Service; JSON = MessagingV1Service } "./MessagingV1Service";

// ListServiceResponse.mo

module {
    // User-facing type: what application code uses
    public type ListServiceResponse = {
        services : ?[MessagingV1Service];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListServiceResponse type
        public type JSON = {
            services : ?[MessagingV1Service];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListServiceResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListServiceResponse = ?json;
    }
}

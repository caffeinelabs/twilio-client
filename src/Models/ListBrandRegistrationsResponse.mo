
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1BrandRegistrations; JSON = MessagingV1BrandRegistrations } "./MessagingV1BrandRegistrations";

// ListBrandRegistrationsResponse.mo

module {
    // User-facing type: what application code uses
    public type ListBrandRegistrationsResponse = {
        data : ?[MessagingV1BrandRegistrations];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListBrandRegistrationsResponse type
        public type JSON = {
            data : ?[MessagingV1BrandRegistrations];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListBrandRegistrationsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListBrandRegistrationsResponse = ?json;
    }
}

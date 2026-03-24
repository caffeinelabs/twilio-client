
import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1BrandRegistrationsBrandVetting; JSON = MessagingV1BrandRegistrationsBrandVetting } "./MessagingV1BrandRegistrationsBrandVetting";

// ListBrandVettingResponse.mo

module {
    // User-facing type: what application code uses
    public type ListBrandVettingResponse = {
        data : ?[MessagingV1BrandRegistrationsBrandVetting];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListBrandVettingResponse type
        public type JSON = {
            data : ?[MessagingV1BrandRegistrationsBrandVetting];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListBrandVettingResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListBrandVettingResponse = ?json;
    }
}


import { type ListAlphaSenderResponseMeta; JSON = ListAlphaSenderResponseMeta } "./ListAlphaSenderResponseMeta";

import { type MessagingV1TollfreeVerification; JSON = MessagingV1TollfreeVerification } "./MessagingV1TollfreeVerification";

// ListTollfreeVerificationResponse.mo

module {
    // User-facing type: what application code uses
    public type ListTollfreeVerificationResponse = {
        verifications : ?[MessagingV1TollfreeVerification];
        meta : ?ListAlphaSenderResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListTollfreeVerificationResponse type
        public type JSON = {
            verifications : ?[MessagingV1TollfreeVerification];
            meta : ?ListAlphaSenderResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListTollfreeVerificationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListTollfreeVerificationResponse = ?json;
    }
}

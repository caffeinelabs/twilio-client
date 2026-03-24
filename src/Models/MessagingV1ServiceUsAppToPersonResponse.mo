
import { type MessagingV1ServiceUsAppToPerson; JSON = MessagingV1ServiceUsAppToPerson } "./MessagingV1ServiceUsAppToPerson";

import { type MessagingV1ServiceUsAppToPersonV2; JSON = MessagingV1ServiceUsAppToPersonV2 } "./MessagingV1ServiceUsAppToPersonV2";

// MessagingV1ServiceUsAppToPersonResponse.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type MessagingV1ServiceUsAppToPersonResponse = {
        #MessagingV1ServiceUsAppToPerson : MessagingV1ServiceUsAppToPerson;
        #MessagingV1ServiceUsAppToPersonV2 : MessagingV1ServiceUsAppToPersonV2;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : MessagingV1ServiceUsAppToPersonResponse) : Text =
            switch (value) {
                case (#MessagingV1ServiceUsAppToPerson(v)) Runtime.unreachable();
                case (#MessagingV1ServiceUsAppToPersonV2(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceUsAppToPersonResponse type
        public type JSON = {
            #MessagingV1ServiceUsAppToPerson : MessagingV1ServiceUsAppToPerson;
            #MessagingV1ServiceUsAppToPersonV2 : MessagingV1ServiceUsAppToPersonV2;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceUsAppToPersonResponse) : JSON =
            switch (value) {
                case (#MessagingV1ServiceUsAppToPerson(v)) #MessagingV1ServiceUsAppToPerson(v);
                case (#MessagingV1ServiceUsAppToPersonV2(v)) #MessagingV1ServiceUsAppToPersonV2(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceUsAppToPersonResponse =
            switch (json) {
                case (#MessagingV1ServiceUsAppToPerson(v)) ?#MessagingV1ServiceUsAppToPerson(v);
                case (#MessagingV1ServiceUsAppToPersonV2(v)) ?#MessagingV1ServiceUsAppToPersonV2(v);
            };
    }
}

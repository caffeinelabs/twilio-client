
import { type MessageFeedbackEnumOutcome; JSON = MessageFeedbackEnumOutcome } "./MessageFeedbackEnumOutcome";

// ApiV2010AccountMessageMessageFeedback.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountMessageMessageFeedback = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) associated with this MessageFeedback resource.
        account_sid : ?Text;
        /// The SID of the Message resource associated with this MessageFeedback resource.
        message_sid : ?Text;
        outcome : ?MessageFeedbackEnumOutcome;
        /// The date and time in GMT when this MessageFeedback resource was created, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT when this MessageFeedback resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountMessageMessageFeedback type
        public type JSON = {
            account_sid : ?Text;
            message_sid : ?Text;
            outcome : ?MessageFeedbackEnumOutcome.JSON;
            date_created : ?Text;
            date_updated : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountMessageMessageFeedback) : JSON = { value with
            outcome = do ? { MessageFeedbackEnumOutcome.toJSON(value.outcome!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountMessageMessageFeedback {
            ?{ json with
                outcome = do ? { MessageFeedbackEnumOutcome.fromJSON(json.outcome!)! };
            }
        };
    }
}

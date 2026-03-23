
// MessageFeedbackEnumOutcome.mo
/// Reported outcome indicating whether there is confirmation that the Message recipient performed a tracked user action. Can be: `unconfirmed` or `confirmed`. For more details see [How to Optimize Message Deliverability with Message Feedback](https://www.twilio.com/docs/messaging/guides/send-message-feedback-to-twilio).
/// Enum values: #confirmed, #unconfirmed

module {
    // User-facing type: type-safe variants for application code
    public type MessageFeedbackEnumOutcome = {
        #confirmed;
        #unconfirmed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessageFeedbackEnumOutcome type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageFeedbackEnumOutcome) : JSON =
            switch (value) {
                case (#confirmed) "confirmed";
                case (#unconfirmed) "unconfirmed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessageFeedbackEnumOutcome =
            switch (json) {
                case "confirmed" ?#confirmed;
                case "unconfirmed" ?#unconfirmed;
                case _ null;
            };
    }
}

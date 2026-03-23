
// MessageEnumScheduleType.mo
/// For Messaging Services only: Include this parameter with a value of `fixed` in conjuction with the `send_time` parameter in order to [schedule a Message](https://www.twilio.com/docs/messaging/features/message-scheduling).
/// Enum values: #fixed

module {
    // User-facing type: type-safe variants for application code
    public type MessageEnumScheduleType = {
        #fixed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessageEnumScheduleType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageEnumScheduleType) : JSON =
            switch (value) {
                case (#fixed) "fixed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessageEnumScheduleType =
            switch (json) {
                case "fixed" ?#fixed;
                case _ null;
            };
    }
}

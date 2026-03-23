
// SmsMessageEnumDirection.mo
/// Enum values: #inbound, #outbound_api, #outbound_call, #outbound_reply

module {
    // User-facing type: type-safe variants for application code
    public type SmsMessageEnumDirection = {
        #inbound;
        #outbound_api;
        #outbound_call;
        #outbound_reply;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SmsMessageEnumDirection type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SmsMessageEnumDirection) : JSON =
            switch (value) {
                case (#inbound) "inbound";
                case (#outbound_api) "outbound-api";
                case (#outbound_call) "outbound-call";
                case (#outbound_reply) "outbound-reply";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SmsMessageEnumDirection =
            switch (json) {
                case "inbound" ?#inbound;
                case "outbound-api" ?#outbound_api;
                case "outbound-call" ?#outbound_call;
                case "outbound-reply" ?#outbound_reply;
                case _ null;
            };
    }
}
